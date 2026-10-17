import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/l10n/l10n.dart';

class App extends StatefulWidget {
  const new({
    required this.getIt,
    super.key,
    this.locale,
    this.initialLocation = AppRoutes.home,
  });

  /// Forwarded to the router; never resolved from inside widgets.
  final GetIt getIt;

  /// Overrides the device locale; used by tests.
  final Locale? locale;
  final String initialLocation;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router = createRouter(
    getIt: widget.getIt,
    initialLocation: widget.initialLocation,
  );

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      onGenerateTitle: (context) => context.l10n.appTitle,
      theme: AppTheme.light,
      locale: widget.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
    );
  }
}
