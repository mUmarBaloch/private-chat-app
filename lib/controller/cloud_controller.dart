import 'dart:async';

import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

late FirebaseFirestore cloud;

class Cloud extends AuthController {
  initCloud() {
    cloud = FirebaseFirestore.instance;
  }

  storeToken(String token, String name) async {
    String uid = getUserId;
    await cloud.collection('users').doc(uid).set({
      'name': name,
      'token': FieldValue.arrayUnion([token])
    });
  }

  createChat(Chat chat) async {
    await cloud.collection('chats').add(chat.toMap());
  }

  Future<dynamic> deleteChat(Timestamp time, Chat chat, User? user) async {
    if (chat.uid == user!.uid) {
      var get =
          await cloud.collection('chats').where('time', isEqualTo: time).get();
      return await get.docs.first.reference.delete();
    } else {
      return 'null';
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> loadChat() {
    return cloud
        .collection('chats')
        .orderBy('time', descending: true)
        .snapshots();
  }
}
