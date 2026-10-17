// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Рик и Морти';

  @override
  String get retry => 'Повторить';

  @override
  String get emptyResults => 'Персонажи не найдены';

  @override
  String get goHome => 'На главную';

  @override
  String get pageNotFound => 'Страница не найдена';

  @override
  String get errorNetwork =>
      'Нет подключения к интернету. Проверьте сеть и попробуйте снова.';

  @override
  String get errorServer =>
      'Сервер не отвечает должным образом. Попробуйте позже.';

  @override
  String get errorNotFound => 'Ничего не найдено.';

  @override
  String get errorUnknown => 'Что-то пошло не так. Попробуйте снова.';
}
