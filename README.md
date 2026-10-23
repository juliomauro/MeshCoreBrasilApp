# MeshCore Brasil — App Companion

> **Este é um fork brasileiro.** O MeshCoreBrasilApp é adaptado do
> [lusoapp](https://github.com/Meshcore-Portugal/lusoapp), feito pela e para
> a comunidade portuguesa do MeshCore. Todo o crédito pelo app original é
> deles — veja a [LICENSE](LICENSE) para a atribuição completa. Este fork
> adapta o app para o Brasil: preset de rádio 915 MHz / ANATEL em vez dos
> presets 433/868 MHz da UE, uma página de comunidade brasileira no lugar do
> programa de evento e do recurso Plano 3-3-3 (específicos de Portugal), e
> interface totalmente traduzida para o português do Brasil.

**MeshCore** é um sistema de comunicação em malha (mesh) via LoRa:
descentralizado, seguro e de baixo custo. Com ele você monta sua própria
rede de mensagens criptografadas de longo alcance, que continua funcionando
mesmo quando Wi-Fi, celular ou Starlink caem. *"A comunicação não pode
falhar."*

**MeshCoreBrasilApp** é o aplicativo companion (Flutter) para rádios
MeshCore, feito pela e para a comunidade brasileira de radioamadorismo e
redes mesh.

### Para que serve

- Radioamadorismo
- Áreas remotas (sítios, trilhas, regiões isoladas)
- Operações de resgate
- Comunidades locais
- Monitoramento de sensores (temperatura, umidade, qualidade do ar)
- Equipes de apoio em eventos

### Como entrar na rede

1. **Compre um dispositivo LoRa compatível** — cada participante precisa de
   um nó companion para entrar na malha.
2. **Instale este app** no celular (ou use a [versão web](https://app.meshcore.nz/)
   ou um dispositivo standalone).
3. **Grave o firmware** no dispositivo usando o
   [Flasher da comunidade](https://meshcore.com.br/flasher/).
4. **Adicione repetidores** em pontos estratégicos pra estender a cobertura.

### Comunidade MeshCore Brasil

- Site: [meshcore.com.br](https://meshcore.com.br/)
- Telegram: [t.me/meshcorebrasil](https://telegram.me/meshcorebrasil)
- YouTube: [@MeshCoreBrasil](https://www.youtube.com/@MeshCoreBrasil)
- Mapa da rede: [meshcore.com.br/mapa](https://meshcore.com.br/mapa/)
- Ferramentas da comunidade: [MeshMapper](https://meshcore.com.br/meshmapper/),
  [CoreScope](https://meshcore.com.br/corescope/),
  [Gerador de Nomes para Repetidores](https://meshcore.com.br/gerador-de-nomes-para-repetidores-meshcore/)
- Projeto MeshCore oficial (firmware/protocolo):
  [github.com/meshcore-dev/MeshCore](https://github.com/meshcore-dev/MeshCore)

Esses mesmos links estão dentro do app, na aba **Apps → Comunidade**.

## Features

- **Mensagens por Canal** — Envie e receba mensagens nos canais do MeshCore
- **Chat Privado** — Mensagens 1:1 criptografadas ponta a ponta via Ed25519/X25519
- **Configuração de Rádio** — Controle completo dos parâmetros LoRa (frequência, largura de banda, SF, CR, potência)
- **Gerenciamento de Contatos** — Veja e gerencie os nós descobertos na malha (chat, repetidores, salas, sensores)
- **Conexão BLE** — Conecte a rádios MeshCore ESP32 e nRF52 via Bluetooth Low Energy
- **Conexão Serial** — Conecte via serial USB OTG (115200 8N1)
- **Preset 915 MHz** — Preset de rádio pronto para a faixa ISM da ANATEL (veja a nota abaixo)
- **Interface 100% em português do Brasil**
- **Mapa** — Mapa GPS ao vivo de todos os contatos e nós da malha (OpenStreetMap, sem precisar de API key)
- **Mapa Offline** — Cache de tiles via `flutter_map_tile_caching`; os tiles são salvos automaticamente enquanto você navega e servidos do disco quando offline

> **Nota sobre o cache offline do mapa:** o cache é só baseado em navegação — os tiles são salvos enquanto você explora o mapa online e reproduzidos offline. Não existe um recurso de "baixar esta área" em lote. Isso é intencional: a [política](https://operations.osmfoundation.org/policies/tiles/) dos servidores de tiles do OSM proíbe pré-download em massa de regiões.

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
- [docs/feature-toggles.pt-PT.md](docs/feature-toggles.pt-PT.md) (Portuguese — inherited from upstream, still Portugal wording; a pt-BR version is pending)

## Translations

The app uses Flutter's built-in `flutter_localizations` / `intl` ARB pipeline.

### File layout

```
lib/l10n/
├── app_pt.arb                  ← Template (source of truth, Portuguese — Brazil wording)
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
