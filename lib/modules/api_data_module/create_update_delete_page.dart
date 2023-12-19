import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/data_controller.dart';

import '../../services/storage_services.dart';

class ApiCreateReadUpdateDelete extends StatelessWidget {
  ApiCreateReadUpdateDelete({super.key});

  var crudController = Get.put(ApiDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // GetUtils.
                Text(
                  'Stored Name: ${box.read('name') ?? ''}',
                ),
                IconButton(onPressed: (){
                  box.erase();  //-- to erase all locale storage data
                  box.remove('name');
                }, icon: Icon(Icons.clear))
              ],
            ),
            SizedBox(height: 20,),
            TextFormField(controller: crudController.nameController,),
            SizedBox(height: 20,),
            TextFormField(controller: crudController.jobController,),
            SizedBox(height: 20,),
            Obx(()=>
              ElevatedButton(onPressed: (){
                crudController.createUser();
              }, child: Text(crudController.isLoading.value ? "creating user..." :'create user')),
            )
          ],
        ),
      ),
    );
  }
}
