import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getx/aakarsh.dart';
import 'package:getx/services/firestore_services.dart';

class AstrologerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astrologers'),
      ),
      body: StreamBuilder(
        stream: FireStoreServices.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No users Available'));
          } else {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemExtent: 100,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the MessageScreen with the selected user data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MessageScreen(itemData: data[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Row(
                          children: [
                            SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipOval(
                                    child:
                                        Image.network(data[index]['imageUrl']))),
                            Text(data[index]['userName'])
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
