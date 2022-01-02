
import 'package:chat_app/view/auth/auth_screen.dart';
import 'package:chat_app/view/connection/no_internet.dart';
import 'package:chat_app/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Provider.of<InternetConnectionStatus>(context, listen: true) ==
        InternetConnectionStatus.disconnected) {
      return NoInternet();
    }

    return Provider.of<User?>(context, listen: true)?.uid != null
        ? HomeScreen()
        : AuthScreen();
  }
}
