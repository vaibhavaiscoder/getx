import 'package:get/get.dart';
import 'package:getx/controllers/chat_controller.dart';
import 'package:getx/controllers/data_controller.dart';
import 'package:getx/modules/multi_langual_module/language_controller.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiDataController());

    Get.lazyPut(() => ChatController());

    Get.lazyPut(() => ApiLanguageController());
  }

}