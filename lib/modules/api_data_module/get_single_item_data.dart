import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/data_controller.dart';

class ApiSingleUserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Network Call - Single User'),
      ),
      body: GetBuilder<ApiDataController>(
        builder: (controller) {
          return controller.obx(
                (data) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(data![0]['avatar']),
                  ),
                  SizedBox(height: 20.0),
                  Text(data[0]['first_name'] + ' ' + data[0]['last_name']),
                  SizedBox(height: 10.0),
                  Text(data[0]['email']),
                ],
              ),
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error) => Center(child: Text('Error: $error')),
            onEmpty: const Center(child: Text('No data available')),
          );
        },
      ),
    );
  }
}
