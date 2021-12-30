import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String uid;
  final String name;
  final String chat;
  final DateTime time;

  Chat(
      {required this.uid,
      required this.name,
      required this.chat,
      required this.time});

  toMap() => {
        'uid': uid,
        'name': name,
        'chat': chat,
        'time': time.toString(),
      };

  Chat.fromDocumentSnapshot(DocumentSnapshot map)
      : uid = map['uid'],
        name = map['name'],
        chat = map['chat'],
        time = DateTime.parse(map['time']);
}
