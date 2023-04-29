import 'dart:ui';

import '../core/constans.dart';
import 'package:get/get.dart';

import '../lang/ar_sy.dart';
import '../lang/en_us.dart';


class LocalizationService extends Translations{



  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = AppConstants.englishLocal;

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    AppConstants.englishLang,
  ];


  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    AppConstants.englishLocal,
  ];



  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
};

  // Gets locale from language, and updates the locale
  static void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  static Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) {
        return locales[i];
      }
    }
    return Get.locale;
  }

}