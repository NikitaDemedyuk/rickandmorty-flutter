import 'package:material_ui/material_ui.dart';

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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Icon(icon, size: 48, color: iconColor),
            Text(
              message,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            ?action,
          ],
        ),
      ),
    );
  }
}
