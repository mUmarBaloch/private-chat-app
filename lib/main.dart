// ignore_for_file: prefer_const_constructors

import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/cloud_controller.dart';
import 'package:chat_app/controller/connection_controller.dart';
import 'package:chat_app/view/auth/auth_screen.dart';
import 'package:chat_app/view/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AuthController().initAuth();
  await Cloud().initCloud();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<User?>(
            create: (context) => AuthController().userStream(),
            initialData: null,
          ),
          StreamProvider<InternetConnectionStatus>(
              create: (context) => Connection().checkConnection(),
              initialData: InternetConnectionStatus.disconnected),
        ],
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.deepPurpleAccent,
              textTheme: TextTheme(button: TextStyle(color: Colors.white)),
              primarySwatch: Colors.deepPurple),
          home: Scaffold(
            body: Wrapper(),
          ),
        ));
  }
}
