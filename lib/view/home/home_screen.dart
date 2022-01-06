// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_const

import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/cloud_controller.dart';
import 'package:chat_app/controller/push_notification_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';
import 'chats.dart';
import 'send_messege.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    String user = Provider.of<User?>(context, listen: false)!.uid;
    PushNotificationController().tokenHandler();
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatApp (umarBDev)'),
        actions: [
          IconButton(
              onPressed: () async {
                await AuthController().signout();
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        color: Colors.grey[900],
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: Cloud().loadChat(),
                builder: (context, snapshot) {
                  var data = snapshot.data?.docs
                      .map((e) => Chat.fromDocumentSnapshot(e))
                      .toList();
                  if (snapshot.hasData) {
                    return Chats(data: data, user: user);
                  }
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }),

            // ignore: prefer_const_literals_to_create_immutables
            SendMessege(textController, user: user),
          ],
        ),
      ),
    );
  }
}
