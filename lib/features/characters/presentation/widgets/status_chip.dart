import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/theme/status_colors.dart';
import 'package:rickandmorty/features/characters/domain/entities/character_status.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// A colored dot with the localized status label.
class StatusChip extends StatelessWidget {
  const new({required this.status, super.key});

  final CharacterStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final statusColors = theme.extension<StatusColors>()!;
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
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: const SizedBox.square(dimension: 8),
            ),
            const SizedBox(width: 6),
            Text(label, style: theme.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
