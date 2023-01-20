
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
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await user?.updateDisplayName(username);
      await user?.updatePhotoURL('https://ih1.redbubble.net/image.2702052291.4780/st,small,845x845-pad,1000x1000,f8f8f8.jpg');

    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  static signOut() async => await FirebaseAuth.instance.signOut();
}