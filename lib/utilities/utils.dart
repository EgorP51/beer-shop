import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum SnackBarType { error, success }

class Utils {
  static final messendgerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(
      {required String text, required SnackBarType snackBarType}) {
    final snackBar = SnackBar(
        content: Text(text),
        backgroundColor:
            snackBarType == SnackBarType.error ? Colors.red : Colors.green);
    messendgerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static void showToast({required String text}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
