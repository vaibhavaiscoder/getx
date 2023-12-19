import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:getx/modules/multi_langual_module/language_controller.dart';
import 'package:getx/utils/strings.dart';

class ChangeLangWithApi extends GetView<ApiLanguageController> {
   ChangeLangWithApi({Key? key});

  List<String> titleschange = [hi,home,welcome,appName];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Network Call'),
      ),
      body: controller.obx(
            (data) => Column(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: titleschange.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          title: Text(titleschange[index]));
                    }),
                ElevatedButton(onPressed: (){
                  // controller.changeLanguageWithApi();
                  }, child: Text('Change language'))
              ],
            ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text('Error: $error')),
        onEmpty: const Center(child: Text('No data available')),
      ),
    );
  }
}

