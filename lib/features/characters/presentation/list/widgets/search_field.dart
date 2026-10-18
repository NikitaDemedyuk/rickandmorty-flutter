import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Search input whose clear button shows only while there is text.
class SearchField extends StatelessWidget {
  const new({required this.controller, required this.onChanged, super.key});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => TextField(
        controller: controller,
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: l10n.searchHint,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: controller.text.isEmpty
              ? null
              : IconButton(
                  tooltip: l10n.clearSearch,
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                ),
          filled: true,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
