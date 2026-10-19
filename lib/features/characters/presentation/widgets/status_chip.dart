import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/theme/status_colors.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/l10n/l10n.dart';

class StatusChip extends StatelessWidget {
  const new({required this.status, super.key});

  final CharacterStatus status;

  /// Keys the colored dot, so tests read its color without matching its shape.
  static const dotKey = Key('status-chip-dot');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColors = StatusColors.of(context);
    final l10n = context.l10n;
    final (label, color) = switch (status) {
      CharacterStatus.alive => (l10n.statusAlive, statusColors.alive),
      CharacterStatus.dead => (l10n.statusDead, statusColors.dead),
      CharacterStatus.unknown => (l10n.statusUnknown, statusColors.unknown),
    };
    return DecoratedBox(
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 6,
          children: [
            DecoratedBox(
              key: dotKey,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: const SizedBox.square(dimension: 8),
            ),
            Text(label, style: theme.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
