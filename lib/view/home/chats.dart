import 'package:chat_app/model/chat_model.dart';
import 'package:flutter/material.dart';

import 'chat_widget.dart';

class Chats extends StatelessWidget {
  final List<Chat>? data;
  final user;
  Chats({required this.data, required this.user});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController =
        ScrollController(initialScrollOffset: data!.length * 100);

    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            reverse: true,
            shrinkWrap: true,
            children: data!.reversed.map((e) {
              if (e.uid == user.toString()) {
                return chatWidget(context, true, e.name, e.chat, e.time);
              }
              return chatWidget(context, true, e.name, e.chat, e.time);
            }).toList(),
          )),
    );
  }
}
