import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/data_controller.dart';
import 'package:getx/routes/app_pages.dart';

class ApiListData extends GetView<ApiDataController> {
  const ApiListData({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Network Call'),
      ),
      body: controller.obx(
            (data) => ListView.builder(
          itemCount: data!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                var userData = data[index]; // Get the data for the selected user
                Get.toNamed(
                  Routes.ARGUMENT_LIST_DATA_SINGLE,
                  arguments: userData, // Pass the user data as arguments
                );
              },

              child: ListTile(
                title: Text(data[index]['first_name']),
                subtitle: Text(data[index]['email']),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(data[index]['avatar']),
                ),
              ),
            );
          },
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text('Error: $error')),
        onEmpty: const Center(child: Text('No data available')),
      ),
    );
  }
}
