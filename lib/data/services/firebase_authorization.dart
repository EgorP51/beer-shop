import 'package:firebase_auth/firebase_auth.dart';

import '../../utilities/utils.dart';

class FirebaseAuthorization {
  static Future signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message!, snackBarType: SnackBarType.error);
    }
  }

  static Future signUp(String email, String password, String username) async {
    try {
      final UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user!.updateDisplayName(username);
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(text: e.message!, snackBarType: SnackBarType.error);
    }
  }

  static Future signOut() async => await FirebaseAuth.instance.signOut();
}
