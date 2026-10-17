import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/widgets/status_view.dart';

class EmptyView extends StatelessWidget {
  const new({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return StatusView(
      icon: Icons.search_off,
      iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
      message: message,
    );
  }
}
