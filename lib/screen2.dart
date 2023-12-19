import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen1.dart';
import 'package:getx/services/services.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  // Services services = Services();
  Services services = Get.find<Services>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Text('screen 2'),
              Obx(
                    () => Switch(
                  value: services.isDarkMode.value,
                  onChanged: (value) {
                    services.toggleTheme(value);
                  },
                  activeTrackColor: Colors.blue,
                  activeColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  inactiveThumbColor: Colors.grey,
                ),
              ),

            ],
          ),
        ),
        floatingActionButton: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              bottom: 80.0,
              right: 16.0,
              child: FloatingActionButton(
                onPressed: () {
                  // Handle onPressed for the first floating action button
                  Get.to(() => Screen1());
                  Get.snackbar('Hhh', 'Coming back to screen 1');
                },
                child: Icon(Icons.navigate_before),
              ),
            ),
            Positioned(
              bottom: 160.0,
              right: 16.0,
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                onPressed: () {
                  Get.bottomSheet(
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                'Bottom Sheet',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Text(
                                'Just Learning',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.thumb_down,
                                    color: Colors.white,
                                  ),
                                  label: Text("No"),
                                ),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: Colors.white,
                                  ),
                                  label: Text("Yes"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      isDismissible: false,
                      enableDrag: false,
                      barrierColor: Colors.orange);
                },
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
        body: Obx(
          () => Center(
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
    );
  }
}
