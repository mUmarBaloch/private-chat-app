// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unnecessary_const

import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'chat_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                reverse: true,
                shrinkWrap: true,
                children: chats.reversed.map((e) {
                  if (e.id % 2 == 0) {
                    return chatWidget(context, false, e.chat);
                  }
                  return chatWidget(context, true, e.chat);
                }).toList(),
              ),
            ),
          ),

          // ignore: prefer_const_literals_to_create_immutables
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(hintText: 'send messege'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      chats.add(Chat(
                          id: chats.length + 1, chat: textController.text));
                    },
                    icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
