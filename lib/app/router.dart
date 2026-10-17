import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/home_placeholder_page.dart';
import 'package:rickandmorty/core/widgets/error_view.dart';
import 'package:rickandmorty/l10n/l10n.dart';

abstract final class AppRoutes {
  static const String home = '/';
}

GoRouter createRouter({String initialLocation = AppRoutes.home}) => GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomePlaceholderPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(),
    body: ErrorView(
      message: context.l10n.pageNotFound,
      onRetry: () => context.go(AppRoutes.home),
    ),
  ),
);
