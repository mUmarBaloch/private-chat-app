import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

late FirebaseFirestore cloud;

class Cloud {
  initCloud() {
    cloud = FirebaseFirestore.instance;
  }

  createChat(Chat chat) async {
    await cloud.collection('chats').add(chat.toMap());
  }

  deleteChat(Chat chat) async {}
  Stream<QuerySnapshot<Map<String, dynamic>>> loadChat() {
    List<DocumentSnapshot>? get;
    return cloud.collection('chats').snapshots();
  }

  List<Chat> chats = [];
}
