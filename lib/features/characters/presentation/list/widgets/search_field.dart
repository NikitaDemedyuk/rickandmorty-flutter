import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Search input whose clear button shows only while there is text.
class SearchField extends StatefulWidget {
  const new({required this.controller, required this.onChanged, super.key});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  /// Rebuilds only when it flips, not on every keystroke, cursor move or
  /// composing update the controller notifies about.
  late bool _isEmpty;

  @override
  void initState() {
    super.initState();
    _isEmpty = widget.controller.text.isEmpty;
    widget.controller.addListener(_syncIsEmpty);
  }

  @override
  void didUpdateWidget(SearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.controller, widget.controller)) return;
    oldWidget.controller.removeListener(_syncIsEmpty);
    widget.controller.addListener(_syncIsEmpty);
    _isEmpty = widget.controller.text.isEmpty;
  }

  @override
  void dispose() {
    widget.controller.removeListener(_syncIsEmpty);
    super.dispose();
  }

  void _syncIsEmpty() {
    final isEmpty = widget.controller.text.isEmpty;
    if (isEmpty != _isEmpty) setState(() => _isEmpty = isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: l10n.searchHint,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _isEmpty
            ? null
            : IconButton(
                tooltip: l10n.clearSearch,
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                  widget.onChanged('');
                },
              ),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
