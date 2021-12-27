import 'package:flutter/material.dart';

Widget chatWidget(
  BuildContext context,
  bool isMine,
  String chat,
) =>
    Container(
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
        child: Text(
          chat,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
