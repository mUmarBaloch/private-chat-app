import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/cloud_controller.dart';
import 'package:chat_app/controller/local_controller.dart';
import 'package:chat_app/view/home/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

late FirebaseMessaging msg;

class PushNotificationController extends Cloud {
  initPushNotifier() async {
    msg = await FirebaseMessaging.instance;
  }

  askPermission() async {
    NotificationSettings settings = await msg.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
  }

  Future<void> setupInteractedMessage(BuildContext context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleInteractions(context, initialMessage);
    }
  }

  void _handleInteractions(BuildContext context, RemoteMessage msg) async {
    if (msg.data['type'] == 'chat') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  tokenHandler() async {
    String? token = await msg.getToken();
    await storeToken(token.toString(), userName!);
  }
}
