import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/features/characters/domain/entities/character.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Species, origin and last known location; unknown places get a
/// placeholder.
class CharacterFacts extends StatelessWidget {
  const new({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          _Fact(
            icon: Icons.science_outlined,
            label: l10n.speciesLabel,
            value: character.species,
          ),
          _Fact(
            icon: Icons.public,
            label: l10n.originLabel,
            value: character.originName ?? l10n.unknownPlace,
          ),
          _Fact(
            icon: Icons.place_outlined,
            label: l10n.locationLabel,
            value: character.locationName ?? l10n.unknownPlace,
          ),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const new({required this.icon, required this.label, required this.value});

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(value),
      subtitle: Text(label),
    );
  }
}
