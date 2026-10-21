import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/l10n/l10n.dart';

class LoadingView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(semanticsLabel: context.l10n.loading),
    );
  }
}
