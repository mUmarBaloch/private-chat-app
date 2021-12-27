class Chat {
  final int id;
  final String chat;
  final DateTime? time;

  Chat({required this.id, required this.chat, this.time});
}

List<Chat> chats = [
  Chat(
    id: 0,
    chat: 'default',
  ),
];
