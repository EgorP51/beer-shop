
import 'package:firebase_auth/firebase_auth.dart';

import '../../utilities/utils.dart';


class FirebaseAuthorization{

  static signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  static signUp(String email, String password, String username) async{
    try {
      final UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await user?.updateDisplayName(username);
      await user?.updatePhotoURL('https://i.pinimg.com/originals/73/9f/50/739f5047dd55a47d50dd5f27a11c0c29.jpg');

    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  static signOut() async => await FirebaseAuth.instance.signOut();
}