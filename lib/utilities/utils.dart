import 'package:flutter/material.dart';

enum SnackBarType { error, success }

class Utils {
  static final messendgerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text, SnackBarType snackBarType) {
    if (text == null) return;

    final snackBar = SnackBar(
        content: Text(text),
        backgroundColor:
            snackBarType == SnackBarType.error ? Colors.red : Colors.green);

    messendgerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
