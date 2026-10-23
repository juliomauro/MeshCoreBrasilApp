/// Build-time feature flags for optional app modules.
///
/// Supported release presets (`FEATURE_PRESET`):
/// - `legacy` (default): preserves existing behaviour
///   (all apps enabled except Topology)
/// - `minimal`: smaller public-facing set
/// - `full`: enables all optional apps
///
/// You can still override any individual app flag using
/// `FEATURE_APP_*` defines. Per-app flags always win over preset defaults.
///
/// Example:
/// flutter build apk --release \
///   --dart-define=FEATURE_PRESET=minimal \
///   --dart-define=FEATURE_APP_RXLOG=true
library;

enum AppFeature {
  topology,
  telemetry,
  rxlog,
  noisefloor,
  dataexport,
  communityLinks,
}

final class FeatureToggles {
  const FeatureToggles._();

  /// Active preset name: `legacy`, `minimal`, or `full`.
  static const String presetName = String.fromEnvironment(
    'FEATURE_PRESET',
    defaultValue: 'legacy',
  );

  static const bool _isMinimalPreset = presetName == 'minimal';
  static const bool _isFullPreset = presetName == 'full';

  // Preset defaults (overridable by per-feature `FEATURE_APP_*` flags).
  // Topology is intentionally off by default for now.
  static const bool _defaultTopology = _isFullPreset;
  static const bool _defaultTelemetry = true;
  static const bool _defaultRxLog = !_isMinimalPreset;
  static const bool _defaultNoiseFloor = !_isMinimalPreset;
  static const bool _defaultDataExport = !_isMinimalPreset;
  static const bool _defaultCommunityLinks = true;

  static const bool appTopology = bool.fromEnvironment(
    'FEATURE_APP_TOPOLOGY',
    defaultValue: _defaultTopology,
  );

  static const bool appTelemetry = bool.fromEnvironment(
    'FEATURE_APP_TELEMETRY',
    defaultValue: _defaultTelemetry,
  );

  static const bool appRxLog = bool.fromEnvironment(
    'FEATURE_APP_RXLOG',
    defaultValue: _defaultRxLog,
  );

  static const bool appNoiseFloor = bool.fromEnvironment(
    'FEATURE_APP_NOISEFLOOR',
    defaultValue: _defaultNoiseFloor,
  );

  static const bool appDataExport = bool.fromEnvironment(
    'FEATURE_APP_DATAEXPORT',
    defaultValue: _defaultDataExport,
  );

  static const bool appCommunityLinks = bool.fromEnvironment(
    'FEATURE_APP_COMMUNITY_LINKS',
    defaultValue: _defaultCommunityLinks,
  );

  static bool isEnabled(AppFeature feature) => switch (feature) {
    AppFeature.topology => appTopology,
    AppFeature.telemetry => appTelemetry,
    AppFeature.rxlog => appRxLog,
    AppFeature.noisefloor => appNoiseFloor,
    AppFeature.dataexport => appDataExport,
    AppFeature.communityLinks => appCommunityLinks,
  };
}
