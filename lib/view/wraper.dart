import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/view/auth/auth_screen.dart';
import 'package:chat_app/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<User?>(context, listen: true)?.uid != null
        ? HomeScreen()
        : AuthScreen();
  }
}
