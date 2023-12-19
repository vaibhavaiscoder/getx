import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/firebase_consts.dart';

class FireStoreServices {

  static getAllUsers() {
    return firestore
        .collection(userCollection)
        .snapshots();
  }
}
