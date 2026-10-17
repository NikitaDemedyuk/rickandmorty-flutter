// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Rick and Morty';

  @override
  String get retry => 'Retry';

  @override
  String get emptyResults => 'No characters found';

  @override
  String get goHome => 'Go home';

  @override
  String get pageNotFound => 'Page not found';

  @override
  String get errorNetwork =>
      'No internet connection. Check your network and try again.';

  @override
  String get errorServer =>
      'The server is not responding properly. Please try again later.';

  @override
  String get errorNotFound => 'Nothing was found.';

  @override
  String get errorUnknown => 'Something went wrong. Please try again.';
}
