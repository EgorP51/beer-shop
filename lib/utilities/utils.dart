import 'package:flutter/material.dart';

class Utils {

  static final messendgerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text){
    if(text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messendgerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}