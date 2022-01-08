import 'package:chat_app/controller/cloud_controller.dart';
import 'package:chat_app/controller/local_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SendMessege extends StatelessWidget {
  final TextEditingController textController;
  final User? user;
  SendMessege(this.textController, {required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(hintText: '  send messege'),
            ),
          ),
          IconButton(
              onPressed: () async {
                if (textController.text != '') {
                  await Cloud().createChat(Chat(
                      uid: user!.uid,
                      name: userName ?? 'null',
                      chat: textController.text,
                      time: Timestamp.now()));
                  textController.text == '';
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                }
              },
              icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
