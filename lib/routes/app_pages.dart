import 'package:get/get.dart';
import 'package:getx/aakarsh.dart';
import 'package:getx/astro_list.dart';
import 'package:getx/bindings/data_bindings.dart';
import 'package:getx/modules/api_data_module/arguments_data_from_api_list.dart';
import 'package:getx/modules/api_data_module/create_update_delete_page.dart';
import 'package:getx/modules/api_data_module/get_list_items_page.dart';
import 'package:getx/modules/api_data_module/get_single_item_data.dart';
import 'package:getx/modules/multi_langual_module/change_lang_with_api.dart';
import 'package:getx/screen1.dart';

part './app_routes.dart';

abstract class AppPages {
  static const INITIAL = Routes.API_LIST_DATA;

  static final pages = [
    GetPage(
      name: Routes.SCREEN1,
      page: () => Screen1(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.API_LIST_DATA,
      page: () => ApiListData(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.ARGUMENT_LIST_DATA_SINGLE,
      page: () => ArgumentsApiSingleUserData(),
      binding: DataBinding(),
      // fullscreenDialog: true,
      transition: Transition.circularReveal,
      preventDuplicates: false  //-- by default it will be true make it false to get multiple of same screens
    ),
    GetPage(
      name: Routes.API_SINGLE_USER_DATA,
      page: () => ApiSingleUserData(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.API_CREATE_UPDATE_DELETE,
      page: () => ApiCreateReadUpdateDelete(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.ASTRO_LIST,
      page: () => AstrologerListScreen(),
      binding: DataBinding(),
    ),
    GetPage(
      name: Routes.CHANG_LANG_API,
      page: () => ChangeLangWithApi(),
      binding: DataBinding(),
    ),
  ];
}