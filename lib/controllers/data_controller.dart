import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/provider/data_provider.dart';

import '../services/storage_services.dart';

class ApiDataController extends GetxController with StateMixin<List<dynamic>> {

  var nameController = TextEditingController();
  var jobController = TextEditingController();
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

  void createUser() {
    final name = nameController.text;
    final job = jobController.text;

    if (name.isNotEmpty && job.isNotEmpty) {

      isLoading.value = true;

      Provider().createUser(name, job).then(
            (value) {
              isLoading.value = false;
          change([value], status: RxStatus.success());
          // Show a success message or handle it as needed
          Get.defaultDialog(
            // barrierDismissible: false,
              title: "Success",
              content: Column(
                children: [
                  Text("Name: ${value['name']}"),
                  Text("Job: ${value['job']}"),
                  Text("ID: ${value['id']}"),
                  Text("Created At: ${value['createdAt']}"),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  String name = value['name'];
                  print(name);
                  box.write('name',name);
                  Get.back();
                }, child: Text('tap to store locally'),),
              ]
          );
        },
        onError: (error) {
          isLoading.value = false;
          change(null, status: RxStatus.error(error.toString()));
          // Handle the error, show an error message, etc.
          Get.snackbar('Error', 'Failed to create user: $error');
        },
      );
    } else {
      // Show an error message or handle the case where fields are empty
      Get.snackbar('Error', 'Name and Job cannot be empty');
    }
  }

  void updateUser() {
    final name = nameController.text;
    final job = jobController.text;

    if (name.isNotEmpty && job.isNotEmpty) {
      Provider().updateUser(name, job).then(
            (value) {
          change([value], status: RxStatus.success());
          // Show a success message or handle it as needed
          Get.defaultDialog(
            // barrierDismissible: false,
              title: "Success",
              content: Column(
                children: [
                  Text("Name: ${value['name']}"),
                  Text("Job: ${value['job']}"),
                  Text("Updated At: ${value['updatedAt']}"),
                ],
              ),
              actions: [
                ElevatedButton(onPressed: (){
                  Get.back();
                }, child: Text('Ok'),),
              ]
          );
        },
        onError: (error) {
          change(null, status: RxStatus.error(error.toString()));
          // Handle the error, show an error message, etc.
          Get.snackbar('Error', 'Failed to update user: $error');
        },
      );
    } else {
      // Show an error message or handle the case where fields are empty
      Get.snackbar('Error', 'Name and Job cannot be empty');
    }
  }

  void deleteUser() {
    Provider().deleteUser().then(
          (value) {
        change([value], status: RxStatus.success());
        // Show a success message or handle it as needed
        Get.snackbar('Success', 'User deleted successfully');
      },
      onError: (error) {
        change(null, status: RxStatus.error(error.toString()));
        // Handle the error, show an error message, etc.
        Get.snackbar('Error', 'Failed to deleted user: $error');
      },
    );
  }


}
