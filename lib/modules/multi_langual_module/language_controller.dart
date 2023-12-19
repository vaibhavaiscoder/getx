import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/provider/data_provider.dart';
import 'package:getx/utils/strings.dart';

class ApiLanguageController extends GetxController
    with StateMixin<List<dynamic>> {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());

    Provider().getUserList().then(
      (value) {
        change(value, status: RxStatus.success());
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      },
    );

    Provider().getSingleUser().then(
      (value) {
        change([value], status: RxStatus.success());
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
      },
    );
  }

  // void changeLanguageWithApi() {
  //   isLoading.value = true;
  //
  //   Provider().changeLanguageWithApi('hi').then(
  //         (value) {
  //       isLoading.value = false;
  //       // Update the data with translated texts
  //       change(translations, status: RxStatus.success());
  //       print(translations);
  //     },
  //     onError: (error) {
  //       isLoading.value = false;
  //       change(null, status: RxStatus.error(error.toString()));
  //       Get.snackbar('Error', 'Failed to translate texts: $error');
  //     },
  //   );
  // }

}
