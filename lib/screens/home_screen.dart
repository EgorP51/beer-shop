import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/logo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('main screen'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          children: [
            Text('email: ${user!.email!}'),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('sign out'))
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(
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
                    NetworkImage(user.photoURL ?? 'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000'),
                    backgroundColor: Colors.transparent,
                  ),
                  Text(user.displayName ?? 'username = null' ,style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),),
                  Text(user.email!,style: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 15),)
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
