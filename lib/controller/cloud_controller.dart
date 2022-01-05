import 'dart:async';

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

  deleteChat(Timestamp time) async {
    var get =
        await cloud.collection('chats').where('time', isEqualTo: time).get();
    await get.docs.first.reference.delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> loadChat() {
    return cloud.collection('chats').snapshots();
  }

  map(snapshot) async {
    await snapshot.data?.docs.map((e) => Chat.fromDocumentSnapshot(e)).toList();
  }
}
