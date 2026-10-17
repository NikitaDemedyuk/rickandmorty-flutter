import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Temporary home screen; replaced by the characters list.
class HomePlaceholderPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(context.l10n.appTitle)));
  }
}
