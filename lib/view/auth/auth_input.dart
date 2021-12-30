// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

TextFormField authInput(controller, text, obscureText) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      } else if (value.length < 4) {
        return 'please enter prescribed text';
      }
      return null;
    },
    obscureText: obscureText,
    controller: controller,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: text,
      hintStyle: const TextStyle(color: Colors.white),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 3)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 3)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 3)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      )),
    ),
  );
}
