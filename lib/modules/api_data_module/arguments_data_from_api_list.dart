import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentsApiSingleUserData extends StatelessWidget {
  var data = Get.arguments;

  ArgumentsApiSingleUserData({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX argument data view'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(data['avatar']),
            ),
            Text('First Name: ${data['first_name']}'),
            Text('Last Name: ${data['last_name']}'),
            Text('Email: ${data['email']}'),
          ],
        ),
      )
    );
  }
}
