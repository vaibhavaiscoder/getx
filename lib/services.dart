import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Services extends GetxController{
  var num = 0.obs;
  var sa = 0.obs;
  RxBool isDarkMode = true.obs;

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeTheme(isDarkMode.value ? ThemeData.dark() : ThemeData.light());
  }

  increasenum(){
    num+=1;
  }
  increasesa(){
    sa+=1;
  }
}