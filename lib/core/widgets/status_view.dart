import 'package:material_ui/material_ui.dart';

/// Centered icon + message (+ optional action) layout shared by the full-page
/// state views.
class StatusView extends StatelessWidget {
  const new({
    required this.icon,
    required this.iconColor,
    required this.message,
    this.action,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final action = this.action;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: iconColor),
            const SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            if (action != null) ...[const SizedBox(height: 16), action],
          ],
        ),
      ),
    );
  }
}
