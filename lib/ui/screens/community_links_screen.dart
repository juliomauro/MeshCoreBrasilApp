import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ---------------------------------------------------------------------------
// Community link data — edit this list to update what the app shows.
// ---------------------------------------------------------------------------

const _accentColor = Color(0xFF009C3B); // Brazilian green

class _LinkItem {
  const _LinkItem(this.label, this.url, this.icon);
  final String label;
  final String url;
  final IconData icon;
}

class _LinkCategory {
  const _LinkCategory(this.title, this.icon, this.items);
  final String title;
  final IconData icon;
  final List<_LinkItem> items;
}

const _categories = <_LinkCategory>[
  _LinkCategory('Comunidade', Icons.forum_outlined, [
    _LinkItem(
      'Telegram da comunidade brasileira',
      'https://telegram.me/meshcorebrasil',
      Icons.send_outlined,
    ),
    _LinkItem(
      'Canal no YouTube',
      'https://www.youtube.com/@MeshCoreBrasil',
      Icons.smart_display_outlined,
    ),
    _LinkItem(
      'MeshCore Sorocaba',
      'https://www.meshsorocaba.org/',
      Icons.groups_outlined,
    ),
  ]),
  _LinkCategory('Site oficial', Icons.language_outlined, [
    _LinkItem(
      'MeshCore Brasil',
      'https://meshcore.com.br/',
      Icons.home_outlined,
    ),
  ]),
  _LinkCategory('Projeto', Icons.code_outlined, [
    _LinkItem(
      'MeshCore (repositório oficial)',
      'https://github.com/meshcore-dev/MeshCore',
      Icons.code,
    ),
  ]),
  _LinkCategory('Ferramentas', Icons.build_outlined, [
    _LinkItem(
      'Mapa',
      'https://meshcore.com.br/mapa/',
      Icons.map_outlined,
    ),
    _LinkItem(
      'MeshMapper',
      'https://meshcore.com.br/meshmapper/',
      Icons.satellite_alt_outlined,
    ),
    _LinkItem(
      'CoreScope',
      'https://meshcore.com.br/corescope/',
      Icons.insights_outlined,
    ),
    _LinkItem(
      'Flasher',
      'https://meshcore.com.br/flasher/',
      Icons.flash_on_outlined,
    ),
    _LinkItem(
      'Gerador de Nomes para Repetidores',
      'https://meshcore.com.br/gerador-de-nomes-para-repetidores-meshcore/',
      Icons.badge_outlined,
    ),
  ]),
];

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class CommunityLinksScreen extends StatelessWidget {
  const CommunityLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140,
            pinned: true,
            backgroundColor: theme.colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: _HeaderBanner(theme: theme),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final category in _categories) ...[
                    _SectionHeader(
                      icon: category.icon,
                      label: category.title,
                      theme: theme,
                    ),
                    const SizedBox(height: 8),
                    _LinkBlock(items: category.items, theme: theme),
                    const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBanner extends StatelessWidget {
  const _HeaderBanner({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF1A1A2E), _accentColor.withAlpha(40)],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _accentColor.withAlpha(30),
                  border: Border.all(
                    color: _accentColor.withAlpha(100),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.groups_outlined,
                  color: _accentColor,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MESHCORE BRASIL',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: _accentColor,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Comunidade',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.icon,
    required this.label,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: _accentColor),
        const SizedBox(width: 8),
        Text(
          label.toUpperCase(),
          style: theme.textTheme.labelMedium?.copyWith(
            color: _accentColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(color: _accentColor.withAlpha(60), thickness: 1),
        ),
      ],
    );
  }
}

class _LinkBlock extends StatelessWidget {
  const _LinkBlock({required this.items, required this.theme});
  final List<_LinkItem> items;
  final ThemeData theme;

  Future<void> _open(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items)
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withAlpha(80),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withAlpha(60),
              ),
            ),
            child: ListTile(
              dense: true,
              leading: Icon(item.icon, color: _accentColor, size: 20),
              title: Text(
                item.label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              trailing: Icon(
                Icons.open_in_new,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              onTap: () => _open(item.url),
            ),
          ),
      ],
    );
  }
}
