import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/app/theme/app_theme.dart';
import 'package:rickandmorty/l10n/l10n.dart';

class App extends StatefulWidget {
  const new({super.key, this.locale, this.initialLocation = AppRoutes.home});

  /// Overrides the device locale; used by tests.
  final Locale? locale;
  final String initialLocation;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _router = createRouter(
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
