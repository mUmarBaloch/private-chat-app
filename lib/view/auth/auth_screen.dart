import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/controller/local_controller.dart';

import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

import 'auth_input.dart';

class AuthScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[900],
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              authInput(userController, 'user name', false),
              SizedBox(
                height: 20,
              ),
              authInput(emailController, 'email', false),
              const SizedBox(
                height: 20,
              ),
              authInput(passwordController, 'password', true),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  authBtn('new to app', () async {
                    await LocalController().setData(userController.text);

                    await AuthController().signup(
                        emailController.text.toString(),
                        passwordController.text.toString());
                  }),
                  authBtn('Lets Chat', () async {
                    await LocalController().setData(userController.text);

                    await AuthController()
                        .signin(emailController.text, passwordController.text);
                  }),
                ],
              )
            ],
          )),
    );
  }

  TextButton authBtn(txt, onValidate) {
    return TextButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await onValidate();
          }
        },
        child: Card(
          child: SizedBox(
            width: 80,
            height: 30,
            child: Center(
              child: Text(
                '$txt',
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
          ),
        ));
  }
}
