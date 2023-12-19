import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/exit_dialogue.dart';
import 'package:getx/screen2.dart';
import 'package:getx/services/services.dart';
import 'package:getx/utils/strings.dart';

import 'modules/multi_langual_module/chagne_language_with_getx/translations/app_translations.dart';

// local translation of getx here

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

  void _updateLanguage(Language language) async {
    AppTranslation.setLocale(language.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final dialogResult = await Get.defaultDialog(
          // barrierDismissible: false,
          title: "Dialog Box",
          content: const Text('Do you want to exit'),
          actions: [
            ElevatedButton.icon(style: ElevatedButton.styleFrom(primary:Colors.redAccent),onPressed: (){
              Get.back(result: false);
            },icon: const Icon(Icons.thumb_down,color: Colors.white,),label: Text(no.tr),),
            ElevatedButton.icon(style: ElevatedButton.styleFrom(primary:Colors.greenAccent),onPressed: (){
              Get.back(result: true);
            },icon: const Icon(Icons.thumb_up,color: Colors.white,),label: Text(yes.tr),)
          ]
        );

        // Return true or false based on the dialog result
        return dialogResult ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            profile.tr,
            style: const TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.black,
                  ),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      _updateLanguage(language);
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            e.name,
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          // Get.back();
          Get.to(() =>  Screen2());
          Get.snackbar('Hhh', 'Coming back to screen 2',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.all(30),
              backgroundColor: Colors.orange,
              icon: const Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
              shouldIconPulse: false);
        }),
        body: Column(
          children: [
            Obx(
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
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(
                            '${services.sa.toString()}' " suhas",
                            style: const TextStyle(fontSize: 30),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              services.increasenum();
                            },
                            child: const Text('increase vaibhav'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              services.increasesa();
                            },
                            child: const Text('increase suhas'),
                          )
                        ],
                      ),
                    ),
                  ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(titles[index].tr));
                }),
          ],
        ),
      ),
    );
  }
}

class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇸", "English", "en"),
      Language(2, "🇮🇳", "मराठी", "mr"),
      Language(3, "🇮🇳", "हिंदी", "hi")
    ];
  }
}