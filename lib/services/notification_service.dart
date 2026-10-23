import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'storage_service.dart';

/// Wraps [FlutterLocalNotificationsPlugin] and exposes a simple API for
/// firing message notifications, respecting the user's [NotificationSettings].
///
/// Platforms:
/// - Android: uses a dedicated high-importance channel "meshcore_messages".
/// - iOS / macOS: uses UNUserNotificationCenter alerts.
/// - Windows / Linux: supported by flutter_local_notifications >= 18.
/// - Web: notifications are unsupported; all calls are no-ops.
class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  static const _androidChannelId = 'meshcore_messages';
  static const _androidChannelName = 'Mensagens MeshCore';
  static const _androidChannelDesc =
      'Notificacoes de mensagens privadas e de canal';

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;
  int _nextId = 0;

  /// Called when the user taps a notification while the app is running or
  /// resumes from background.  Set this from main.dart after the router is
  /// ready.  Receives the payload string, e.g. "private:<keyHex>" or
  /// "channel:<index>".
  static void Function(String payload)? onTap;

  /// Notification settings, loaded from storage and kept in sync by
  /// [NotificationSettingsNotifier].  Updated externally via [settings].
  NotificationSettings _settings = const NotificationSettings();

  set settings(NotificationSettings s) => _settings = s;

  /// Initialise the plugin.  Must be called once, before any `show*` call.
  Future<void> init() async {
    if (_initialized) return;

    // Web has no local notification support.
    if (kIsWeb) {
      _initialized = true;
      return;
    }

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const macSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const linuxSettings = LinuxInitializationSettings(
      defaultActionName: 'Abrir',
    );

    InitializationSettings initSettings;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        initSettings = const InitializationSettings(android: androidSettings);
      case TargetPlatform.iOS:
        initSettings = const InitializationSettings(iOS: iosSettings);
      case TargetPlatform.macOS:
        initSettings = const InitializationSettings(macOS: macSettings);
      case TargetPlatform.linux:
        initSettings = const InitializationSettings(linux: linuxSettings);
      case TargetPlatform.windows:
        // Windows initialisation — no special settings needed beyond defaults.
        initSettings = const InitializationSettings();
      default:
        _initialized = true;
        return;
    }

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        final payload = details.payload;
        if (payload != null && payload.isNotEmpty) {
          NotificationService.onTap?.call(payload);
        }
      },
    );

    // Create Android notification channels once.
    if (defaultTargetPlatform == TargetPlatform.android) {
      final android =
          _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      await android?.createNotificationChannel(
        const AndroidNotificationChannel(
          _androidChannelId,
          _androidChannelName,
          description: _androidChannelDesc,
          importance: Importance.high,
          playSound: true,
        ),
      );
    }

    _initialized = true;
  }

  /// Request the OS notification permission (Android 13+, iOS, macOS).
  /// Returns true if granted.
  Future<bool> requestPermission() async {
    if (kIsWeb) return false;

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        final impl =
            _plugin
                .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin
                >();
        return (await impl?.requestNotificationsPermission()) ?? false;
      case TargetPlatform.iOS:
        final impl =
            _plugin
                .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin
                >();
        return (await impl?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            )) ??
            false;
      case TargetPlatform.macOS:
        final impl =
            _plugin
                .resolvePlatformSpecificImplementation<
                  MacOSFlutterLocalNotificationsPlugin
                >();
        return (await impl?.requestPermissions(
              alert: true,
              badge: true,
              sound: true,
            )) ??
            false;
      default:
        return true;
    }
  }

  /// Check whether the OS has granted notification permission.
  Future<bool> isPermissionGranted() async {
    if (kIsWeb) return false;
    if (defaultTargetPlatform == TargetPlatform.android) {
      final impl =
          _plugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      return (await impl?.areNotificationsEnabled()) ?? false;
    }
    // iOS/macOS/Windows/Linux — assume granted (checked during request).
    return true;
  }

  /// Show a notification for an incoming private message.
  ///
  /// [senderName] — display name of the sender.
  /// [text] — message body (may be empty for non-text messages).
  /// [senderKeyHex] — full hex public key of the sender; used as navigation
  ///   payload so tapping the notification opens the correct chat.
  /// [isAppInForeground] — pass the current app lifecycle state to honour the
  ///   "only when background" setting.
  Future<void> showPrivateMessage({
    required String senderName,
    required String text,
    String? senderKeyHex,
    bool isAppInForeground = false,
  }) async {
    if (!_shouldSend(
      categoryEnabled: _settings.privateMessages,
      isAppInForeground: isAppInForeground,
    )) {
      return;
    }

    await _show(
      title: senderName,
      body: text.isNotEmpty ? text : '(mensagem recebida)',
      payload: senderKeyHex != null ? 'private:$senderKeyHex' : null,
    );
  }

  /// Show a notification for an incoming channel message.
  ///
  /// [channelName] — name of the channel (may be 'Canal N' if unnamed).
  /// [channelIndex] — channel slot index; used as navigation payload.
  /// [senderName] — display name of the sender.
  /// [text] — message body.
  /// [isMentioned] — true when the message text contains a mention of the user.
  Future<void> showChannelMessage({
    required String channelName,
    required String senderName,
    required String text,
    int? channelIndex,
    bool isAppInForeground = false,
    bool isMentioned = false,
  }) async {
    if (!_shouldSend(
      categoryEnabled: _settings.channelMessages,
      isAppInForeground: isAppInForeground,
    )) {
      return;
    }
    if (_settings.channelMentionsOnly && !isMentioned) return;

    await _show(
      title: channelName,
      body: '$senderName: ${text.isNotEmpty ? text : "(mensagem)"}',
      payload: channelIndex != null ? 'channel:$channelIndex' : null,
    );
  }

  /// Returns the payload string from the notification that launched the app
  /// (cold-start / killed-state tap), or null if the app was not launched via
  /// a notification.  Call this once during startup, after [init].
  Future<String?> getAppLaunchPayload() async {
    if (!_initialized || kIsWeb) return null;
    final details = await _plugin.getNotificationAppLaunchDetails();
    if (details == null || !details.didNotificationLaunchApp) return null;
    return details.notificationResponse?.payload;
  }

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  bool _shouldSend({
    required bool categoryEnabled,
    required bool isAppInForeground,
  }) {
    if (!_initialized) return false;
    if (kIsWeb) return false;
    if (!_settings.enabled) return false;
    if (!categoryEnabled) return false;
    if (_settings.onlyWhenBackground && isAppInForeground) return false;
    return true;
  }

  // ---------------------------------------------------------------------------
  // Android Foreground Service for BLE connection stability
  // ---------------------------------------------------------------------------

  /// Start the Android foreground service with a persistent "Connected to Radio" notification.
  /// This prevents Doze mode from killing BLE connections and background reconnect attempts.
  /// On non-Android platforms, this is a no-op.
  ///
  /// [radioName] — name of the connected radio to display in the notification.
  Future<void> startRadioForeground(String radioName) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    try {
      const channel = MethodChannel('br.meshcorebrasil.app/radio_service');
      await channel.invokeMethod('startRadioForeground', {
        'radioName': radioName,
      });
    } catch (e) {
      // Log but don't crash if the platform method fails
      print('Error starting radio foreground service: $e');
    }
  }

  /// Update the Android foreground notification with latest radio metrics.
  /// No-op on non-Android platforms.
  Future<void> updateRadioForeground({
    String? radioName,
    int? noiseFloor,
    int? lastRssi,
    double? lastSnrDb,
  }) async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    try {
      const channel = MethodChannel('br.meshcorebrasil.app/radio_service');
      await channel.invokeMethod('updateRadioForeground', {
        if (radioName != null) 'radioName': radioName,
        if (noiseFloor != null) 'noiseFloor': noiseFloor,
        if (lastRssi != null) 'lastRssi': lastRssi,
        if (lastSnrDb != null) 'lastSnrDb': lastSnrDb,
      });
    } catch (e) {
      // Log but don't crash if the platform method fails
      print('Error updating radio foreground service: $e');
    }
  }

  /// Stop the Android foreground service and remove the persistent notification.
  /// Called when the BLE connection is lost or the user disconnects.
  /// On non-Android platforms, this is a no-op.
  Future<void> stopRadioForeground() async {
    if (kIsWeb || defaultTargetPlatform != TargetPlatform.android) {
      return;
    }
    try {
      const channel = MethodChannel('br.meshcorebrasil.app/radio_service');
      await channel.invokeMethod('stopRadioForeground');
    } catch (e) {
      // Log but don't crash if the platform method fails
      print('Error stopping radio foreground service: $e');
    }
  }

  Future<void> _show({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      _androidChannelId,
      _androidChannelName,
      channelDescription: _androidChannelDesc,
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
      macOS: iosDetails,
    );

    await _plugin.show(_nextId++, title, body, details, payload: payload);
  }
}

/// AppLifecycleState tracker used by the notification service to decide
/// whether the app is in the foreground.
///
/// Register once with [WidgetsBinding.instance.addObserver] in main.dart.
class AppLifecycleObserver extends WidgetsBindingObserver {
  static AppLifecycleState _state = AppLifecycleState.resumed;
  static final _stateController =
      StreamController<AppLifecycleState>.broadcast();

  static bool get isInForeground => _state == AppLifecycleState.resumed;
  static Stream<AppLifecycleState> get stateChanges => _stateController.stream;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _state = state;
    _stateController.add(state);
  }
}
