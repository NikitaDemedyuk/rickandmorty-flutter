import 'package:material_ui/material_ui.dart';

/// Colors of a character's status. M3's `ColorScheme` has no "success" role,
/// so they live in a theme extension instead of widget literals.
@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const new({required this.alive, required this.dead, required this.unknown});

  final Color alive;
  final Color dead;
  final Color unknown;

  @override
  StatusColors copyWith({Color? alive, Color? dead, Color? unknown}) {
    return StatusColors(
      alive: alive ?? this.alive,
      dead: dead ?? this.dead,
      unknown: unknown ?? this.unknown,
    );
  }

  @override
  StatusColors lerp(StatusColors? other, double t) {
    if (other == null) return this;
    return StatusColors(
      alive: Color.lerp(alive, other.alive, t)!,
      dead: Color.lerp(dead, other.dead, t)!,
      unknown: Color.lerp(unknown, other.unknown, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is StatusColors &&
      other.alive == alive &&
      other.dead == dead &&
      other.unknown == unknown;

  @override
  int get hashCode => Object.hash(alive, dead, unknown);
}
