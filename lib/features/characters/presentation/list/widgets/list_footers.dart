import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/widgets/loading_view.dart';
import 'package:rickandmorty/l10n/l10n.dart';

/// Shown below the items while the next page loads.
class NextPageLoadingFooter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.all(16), child: LoadingView());
  }
}

/// Shown below the items when the next page failed to load.
class NextPageErrorFooter extends StatelessWidget {
  const new({required this.message, required this.onRetry, super.key});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: onRetry, child: Text(context.l10n.retry)),
        ],
      ),
    );
  }
}

/// Shown after the last item.
class EndOfListFooter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(
        context.l10n.endOfList,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
