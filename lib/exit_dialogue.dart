// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// Future<bool?> showExitDialog() async {
//   return await Get.dialog<bool>(
//     Dialog(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "Confirm",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//           ),
//           const Divider(),
//           SizedBox(height: 10),
//           Text(
//             "Are you sure you want to exit?",
//             style: TextStyle(fontSize: 16),
//           ),
//           SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: () => Get.back(result: true),
//                 child: Text("Yes"),
//               ),
//               ElevatedButton(
//                 onPressed: () => Get.back(result: false),
//                 child: Text("No"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }