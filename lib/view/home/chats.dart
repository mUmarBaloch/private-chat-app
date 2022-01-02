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
            child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  if (data![index].uid == user) {
                    return chatWidget(context, index, true, data![index].name,
                        data![index].chat, data![index].time);
                  }
                  return chatWidget(context, index, false, data![index].name,
                      data![index].chat, data![index].time);
                })));
  }
}
