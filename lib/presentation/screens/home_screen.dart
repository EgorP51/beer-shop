import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/firebase_authorization.dart';


class HomeScreen extends StatelessWidget {

  final user = FirebaseAuth.instance.currentUser;

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
          ],
        ),
      ),
      drawer: _drawer(context)
    );
  }

  Widget _drawer(BuildContext context){
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsetsDirectional.only(
                  top: 25
              ),
              height: 190,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                    NetworkImage(user?.photoURL ?? 'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000'),
                    backgroundColor: Colors.transparent,
                  ),
                  Text(user?.displayName ?? 'username == null' ,style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),),
                  Text(user!.email!,style: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 15),)
                ],
              )
          ),
          ElevatedButton(
                onPressed: () {
                  FirebaseAuthorization.signOut();
                },
                child: const Text('sign out')),
        ],
      ),
    );
  }
}
