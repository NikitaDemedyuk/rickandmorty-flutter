import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/widgets/status_view.dart';
import 'package:rickandmorty/l10n/l10n.dart';

class ErrorView extends StatelessWidget {
  const new({required this.message, this.onRetry, this.actionLabel, super.key});

  final String message;
  final VoidCallback? onRetry;

  /// Label of the action button; defaults to "Retry".
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return StatusView(
      icon: Icons.error_outline,
      iconColor: Theme.of(context).colorScheme.error,
      message: message,
      action: onRetry == null
          ? null
          : FilledButton.tonal(
              onPressed: onRetry,
              child: Text(actionLabel ?? context.l10n.retry),
            ),
    );
  }
}
