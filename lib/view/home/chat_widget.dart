import 'package:chat_app/controller/cloud_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget chatWidget(
  BuildContext context,
  int key,
  bool isMine,
  String name,
  String chat,
  Timestamp time,
) =>
    Container(
      key: Key(key.toString()),
      decoration: BoxDecoration(
        color: isMine ? Colors.deepPurple : Colors.deepPurple[400],
        borderRadius: BorderRadius.only(
            topLeft: isMine ? Radius.circular(20) : Radius.circular(5),
            bottomLeft: isMine ? Radius.circular(20) : Radius.circular(5),
            topRight: !isMine ? Radius.circular(20) : Radius.circular(5),
            bottomRight: !isMine ? Radius.circular(20) : Radius.circular(5)),
      ),
      margin: isMine
          ? EdgeInsets.fromLTRB(20, 2, 0, 10)
          : EdgeInsets.fromLTRB(0, 2, 20, 10),
      child: Container(
        alignment: isMine ? Alignment.centerLeft : Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          title: Text(
            chat,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            '$name , day: ${time.toDate().day.toString()}, time:${time.toDate().hour.toString()}:${time.toDate().minute.toString()}',
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => Cloud().deleteChat(time),
          ),
        ),
      ),
    );
