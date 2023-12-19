import 'dart:ui';
import 'package:get/get.dart';
import 'package:getx/modules/multi_langual_module/chagne_language_with_getx/translations/en_US/en_us_translations.dart';
import 'package:getx/services/storage_services.dart';
import 'hi_HI/hi_hn_translations.dart';
import 'mr_MR/mr_mt_translations.dart';

class AppTranslation extends Translations  {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');
  static const _languageKey = 'selected_language';
  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'hi': hiHn,
    'mr': mrMt
  };

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'hi': hiHn,
    'mr': mrMt
  };

  static Locale get savedLocale {
    final savedLanguage = box.read(_languageKey);
    return savedLanguage != null ? Locale(savedLanguage) : fallbackLocale;
  }
  static void setLocale(String languageCode) {
    final newLocale = Locale(languageCode);
    box.write(_languageKey, languageCode);
    Get.updateLocale(newLocale);
  }
}