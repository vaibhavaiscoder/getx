import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/chat_model.dart';

class ChatController extends GetxController {
  // final CollectionReference messages =
  //     FirebaseFirestore.instance.collection('chat_rooms');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController textEditingController = TextEditingController();

  void  sendMessage(String receiverId) async {
    String message = textEditingController.text;
    String senderId = "8wiLjMX2L4c6MrZuQGO6hrAjZAk2";
    String senderName = "vaibhava";
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: senderId,
        senderName: senderName,
        receiverId: receiverId,
        message: message,
        timestamp: timestamp);

    List<String> ids = [senderId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());

    textEditingController.clear();
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId){
    List<String> ids = [userId,otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return _firestore.collection('chat_rooms').doc(chatRoomId).collection('messages').orderBy('timestamp',descending: false).snapshots();
  }
}
