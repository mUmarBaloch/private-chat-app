import 'dart:async';

import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

late FirebaseFirestore cloud;

class Cloud extends AuthController {
  initCloud() {
    cloud = FirebaseFirestore.instance;
  }

  storeToken(String token) async {
    String uid = getUserId;
    await cloud.collection('users').doc(uid).set({
      'token': FieldValue.arrayUnion([token])
    });
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
}
