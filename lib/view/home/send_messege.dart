import 'package:chat_app/controller/cloud_controller.dart';
import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

class SendMessege extends StatelessWidget {
  final TextEditingController textController;
  final user;
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
                await Cloud().createChat(Chat(
                    uid: user,
                    name: 'user',
                    chat: textController.text,
                    time: DateTime.now()));
              },
              icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
