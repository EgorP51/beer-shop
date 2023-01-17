import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{

  late final _email;
  late final _password;

  MainScreen(this._email,this._password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('main screen'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text('email: ' + _email),
            Text('password: ' + _password)
          ],
        ),
      ),

    );
  }

}