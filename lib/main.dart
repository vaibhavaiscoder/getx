import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx/modules/multi_langual_module/chagne_language_with_getx/translations/app_translations.dart';
import 'package:getx/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: AppTranslation.savedLocale,
        fallbackLocale: AppTranslation.fallbackLocale,
        translations: AppTranslation(),
        defaultTransition: Transition.cupertino,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.pages);
  }
}