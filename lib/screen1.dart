import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/exit_dialogue.dart';
import 'package:getx/screen2.dart';
import 'package:getx/services.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  // Services services = Services();
  final Services services = Get.put(Services());

  double pw = Get.size.width;  // to set the width of the widget according to screen size
  double ph = Get.size.height; // to set the height of the widget according to screen size

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final dialogResult = await Get.defaultDialog(
          // barrierDismissible: false,
          title: "Dialog Box",
          content: Text('Do you want to exit'),
          actions: [
            ElevatedButton.icon(style: ElevatedButton.styleFrom(primary:Colors.redAccent),onPressed: (){
              Get.back(result: false);
            },icon: Icon(Icons.thumb_down,color: Colors.white,),label: Text("No"),),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(primary:Colors.greenAccent),onPressed: (){
              Get.back(result: true);
            },icon: Icon(Icons.thumb_up,color: Colors.white,),label: Text("Yes"),)
          ]
        );

        // Return true or false based on the dialog result
        return dialogResult ?? false;
      },
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('screen 1'),
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            // Get.back();
            Get.to(() => Screen2());
            Get.snackbar('Hhh', 'Coming back to screen 2',
                snackPosition: SnackPosition.BOTTOM,
                margin: EdgeInsets.all(30),
                backgroundColor: Colors.orange,
                icon: Icon(
                  Icons.thumb_up,
                  color: Colors.white,
                ),
                shouldIconPulse: false);
          }),
          body: Obx(
                () =>
                Center(
                  child: Container(
                    height: ph*(0.5),
                    width: pw*(0.8),
                    color: Colors.orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${services.num.toString()}' " vaibhav",
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${services.sa.toString()}' " suhas",
                          style: TextStyle(fontSize: 30),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            services.increasenum();
                          },
                          child: Text('increase vaibhav'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            services.increasesa();
                          },
                          child: Text('increase suhas'),
                        )
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
