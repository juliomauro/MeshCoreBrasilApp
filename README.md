# Companion App for the Brazilian MeshCore Community

> **This is a Brazilian fork.** MeshCoreBrasilApp is adapted from
> [lusoapp](https://github.com/Meshcore-Portugal/lusoapp), built by and for
> the Portuguese MeshCore community. All credit for the original app goes to
> them — see [LICENSE](LICENSE) for the full attribution. This fork adapts it
> for Brazil: 915 MHz / ANATEL radio preset instead of 433/868 MHz EU
> presets, a Brazilian community links page instead of the PT-specific event
> program and Plano 3-3-3 features, and (in progress) `pt-BR` localization.

**MeshCoreBrasilApp** is a Flutter companion app for [MeshCore](https://meshcore.net) radios, built by and for the Brazilian amateur radio and mesh networking community.

## Features

- **Channel Messaging** — Send and receive messages on MeshCore channels
- **Private Chat** — End-to-end encrypted 1:1 messaging via Ed25519/X25519
- **Radio Configuration** — Full LoRa parameter control (frequency, bandwidth, SF, CR, TX power)
- **Contact Management** — View and manage discovered mesh nodes (chat, repeaters, rooms, sensors)
- **BLE Connection** — Connect to ESP32 and nRF52 MeshCore radios via Bluetooth Low Energy
- **Serial Connection** — Connect via USB OTG serial (115200 8N1)
- **915 MHz Preset** — Quick radio preset for the Brazilian ANATEL ISM band (see note below)
- **Portuguese UI** — Full Portuguese interface (currently Portugal wording; `pt-BR` adaptation in progress)
- **Map View** — Live GPS map of all contacts and mesh nodes (OpenStreetMap, no API key required)
- **Offline Map** — Browse-cached tiles via `flutter_map_tile_caching`; tiles are stored automatically as you pan/zoom and served from disk when offline

> **Note on offline map caching:** Tile caching is purely browse-based — tiles are saved as you explore the map while online and replayed when offline. There is no "download this area" bulk pre-download feature. This is intentional: OSM's tile server [policy](https://operations.osmfoundation.org/policies/tiles/) forbids bulk pre-downloading of regions.

## Quick Start

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) >= 3.29.0
- Android Studio or VS Code with Flutter extensions
- A MeshCore radio (ESP32 or nRF52 based)

### Build & Run

```bash
# Clone the repository
git clone <repo-url> meshcorebrasilapp
cd meshcorebrasilapp

# Get dependencies
flutter pub get

# Run on connected device
flutter run

# Build release APK
flutter build apk --release

# MacinCloud iOS release build (with icon generation)
./scripts/build.macincloud.sh --release
```

### Supported Platforms

| Platform | Transport    | Status         |
| -------- | ------------ | -------------- |
| Android  | BLE + Serial | Primary target |
| iOS      | BLE          | Planned        |
| Windows  | Serial       | Planned        |
| Linux    | Serial       | Planned        |

## Architecture

```
lib/
├── main.dart                    # App entry point
├── protocol/                    # MeshCore protocol implementation
│   ├── kiss.dart                # KISS TNC framing
│   ├── commands.dart            # Command/response constants
│   ├── models.dart              # Data models (Contact, Message, RadioConfig)
│   ├── companion_encoder.dart   # App→Radio frame encoder
│   ├── companion_decoder.dart   # Radio→App frame decoder
│   └── companion_responses.dart # Response/push DTO classes
├── transport/                   # Communication layer
│   ├── radio_transport.dart     # Abstract transport interface
│   ├── ble_transport.dart       # BLE (Nordic UART) transport
│   └── serial_transport.dart    # USB Serial transport
├── services/
│   └── radio_service.dart       # High-level radio communication coordinator
├── providers/
│   ├── radio_providers.dart     # Riverpod state management (entry point)
│   └── parts/                   # Notifiers split by domain
│       ├── connection_notifier.dart
│       ├── messages_notifier.dart
│       └── advert_auto_add.dart
└── ui/
    ├── theme.dart               # Material 3 dark/light theme
    ├── router.dart              # GoRouter navigation
    ├── screens/                 # Core screens (chat, contacts, settings…)
    │   └── parts/               # Per-screen widget parts
    └── apps/                    # Self-contained "apps" launched from the Apps tab
        ├── telemetry/
        ├── topology/
        ├── rx_log/
        └── noise_floor/
```

### Adding a new app

Each entry on the **Apps** tab lives in its own folder under `lib/ui/apps/<name>/`
so it can grow without bloating shared screens. To add one:

1. **Create the folder and screen** — `lib/ui/apps/<name>/<name>_screen.dart`.
   Expose a public widget (e.g. `class MyAppScreen extends ConsumerWidget`).
   Optional sub-widgets go in `lib/ui/apps/<name>/parts/` as Dart `part` files
   (`part of '../<name>_screen.dart';`).
2. **Register the route** in [`lib/ui/router.dart`](lib/ui/router.dart):
   ```dart
   import 'apps/<name>/<name>_screen.dart';
   // …
   GoRoute(path: '/apps/<name>', builder: (_, _) => const MyAppScreen()),
   ```
3. **Add the launcher tile** in [`lib/ui/screens/apps_screen.dart`](lib/ui/screens/apps_screen.dart)
   by appending a new `_AppEntry` to the `_apps` list with `route: '/apps/<name>'`.
4. **(Optional) localise** any user-visible strings via the ARB files in
   `lib/l10n/` — see the [Translations](#translations) section.

That's it: the app appears on the Apps grid, is reachable via deep link, and
keeps its widgets, helpers, and tests isolated from the rest of the codebase.

## Protocol Support

The app implements the **MeshCore Companion Radio Protocol v3**:

- All App→Radio commands (APP_START, SEND_MSG, SEND_CHAN_MSG, GET_CONTACTS, SET_RADIO_PARAMS, etc.)
- All Radio→App responses (SELF_INFO, CONTACT, CHANNEL_MSG_RECV_V3, etc.)
- Unsolicited push notifications (ADVERT, MSG_WAITING, SEND_CONFIRMED, etc.)
- BLE: Nordic UART Service (`6E400001-B5A3-F393-E0A9-E50E24DCCA9E`)
- Serial: 115200 baud, 8N1, DTR+RTS

## Regulatory Information

The default LoRa preset targets the Brazilian ANATEL ISM band (915-928 MHz),
using the convention adopted by the MeshCore Brasil community:
- Frequency: 923.125 MHz
- Bandwidth: 62.5 kHz
- Spreading Factor: 8
- Coding Rate: 4/8
- TX Power: 22 dBm
- Path Hash Mode: after connecting, set it to **2 bytes** (max 32 hops) in
  Radio Settings — this is a live per-device setting (firmware v1.14.0+),
  not part of the band preset, so it must be set once per radio.

**Regulatory note (2026-10):** ANATEL's Ato nº 14158 (published 2026-10-01)
revoked the 6 dB bandwidth exemption for spread-spectrum equipment in the
915-928 MHz band (item 10.3.4), which affects LoRa-based hardware that
doesn't meet the new 500 kHz minimum bandwidth requirement. This applies to
new homologation requests submitted after 2026-10-06 — devices already
homologated before that date (and their renewals) remain valid. If you're
homologating new MeshCore-based hardware in Brazil, confirm current
requirements with ANATEL/SCH before relying on this project.

Users are responsible for compliance with ANATEL regulations and amateur radio licence conditions.

## Contributing

Contributions are welcome! Please see the [ROADMAP.md](ROADMAP.md) for planned features and the project direction.

## Release Feature Presets

For build-time app enable/disable presets and per-feature overrides, see:
- [docs/feature-toggles.md](docs/feature-toggles.md) (English)
- [docs/feature-toggles.pt-PT.md](docs/feature-toggles.pt-PT.md) (Portuguese - Portugal)

## Translations

The app uses Flutter's built-in `flutter_localizations` / `intl` ARB pipeline.

### File layout

```
lib/l10n/
├── app_pt.arb                  ← Template (source of truth, Portuguese PT)
├── app_en.arb                  ← English translation
├── app_es.arb                  ← Spanish translation
├── app_localizations.dart      ← Generated — do NOT edit by hand
├── app_localizations_pt.dart   ← Generated
├── app_localizations_en.dart   ← Generated
├── app_localizations_es.dart   ← Generated
└── l10n.dart                   ← BuildContext extension: context.l10n.<key>
```

Configuration lives in `l10n.yaml` (project root):

```yaml
arb-dir: lib/l10n
template-arb-file: app_pt.arb   # PT is the template locale
output-localization-file: app_localizations.dart
output-dir: lib/l10n
nullable-getter: false
```

### How to add or change a string

1. **Edit `lib/l10n/app_pt.arb`** — add the new key and its Portuguese value.  
   Keys follow the naming convention `<screenOrGroup><PascalCaseName>`, e.g. `commonSave`, `navChannels`, `settingsTitle`.

   ```json
   "myNewKey": "Texto em português",
   "@myNewKey": {}
   ```

2. **Repeat for every other ARB file** (`app_en.arb`, `app_es.arb`, …) adding the translated text for each locale.

3. **Regenerate the Dart classes:**

   ```bash
   flutter gen-l10n
   ```

   This regenerates `app_localizations.dart` and all `app_localizations_<locale>.dart` files.  
   Never edit those files manually — they are overwritten on every run.

4. **Use the string in code:**

   ```dart
   import '../../l10n/l10n.dart';

   // Inside a Widget build method:
   Text(context.l10n.myNewKey)
   ```

### How to add a new language

1. Create `lib/l10n/app_<locale>.arb` — copy `app_en.arb` as a starting point and translate all values.
2. Run `flutter gen-l10n` — the new locale is picked up automatically.
3. No changes to `pubspec.yaml` or `main.dart` are needed; `AppLocalizations.supportedLocales` is generated from the ARB files.

### Placeholders and plurals

Flutter ARB supports ICU message syntax. Example with a parameter:

```json
"unreadCount": "{count} mensagens não lidas",
"@unreadCount": {
  "placeholders": {
    "count": { "type": "int" }
  }
}
```

Usage: `context.l10n.unreadCount(42)`

### Scripts helper

```powershell
# Regenerate translations (run from project root)
flutter gen-l10n
```

---

## License

MIT License — see [LICENSE](LICENSE) for details.
