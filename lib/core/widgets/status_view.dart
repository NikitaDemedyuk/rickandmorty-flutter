import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/core/theme/spacing.dart';

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
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Spacing.lg,
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
