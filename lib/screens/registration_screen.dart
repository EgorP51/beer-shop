import 'package:craft_store/utilities/utils.dart';
import 'package:craft_store/widgets/input_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

// todo: add photo
//https://st2.depositphotos.com/4323461/11559/v/450/depositphotos_115594724-stock-illustration-young-blond-woman-pours-a.jpg - 1
//https://as1.ftcdn.net/v2/jpg/01/69/43/90/1000_F_169439053_CcPE095wGFAxnQwVxDGwC0sURdOhMiPP.jpg - 2
//https://img.freepik.com/premium-vector/cute-cartoon-alien-with-beer_634248-334.jpg - 3

class RegistrationScreen extends StatelessWidget {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _userFormKey = GlobalKey<FormState>();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/background/backgroundimage_loginpage.jpg'),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 400,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.yellow, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputText(
                      controller: _usernameController,
                      hintText: 'username',
                      icon: const Icon(Icons.supervised_user_circle_outlined),
                      obscure: false,
                      validation: Validation.username,
                      formKey: _userFormKey),
                  InputText(
                      controller: _emailController,
                      hintText: 'Enter email',
                      icon: const Icon(Icons.email_outlined),
                      obscure: false,
                      validation: Validation.email,
                      formKey: _emailFormKey),
                  InputText(
                      controller: _passwordController,
                      hintText: 'Enter password',
                      icon: const Icon(Icons.password_outlined),
                      obscure: false,
                      validation: Validation.password,
                      formKey: _passwordFormKey),
                  const SizedBox(
                    height: 30,
                  ),
                  _returnButton(context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _returnButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: const Color(0xFFF77103),
      ),
      child: Text('return to login screen',
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20)),
      onPressed: () {
        final isValidUsername = _userFormKey.currentState!.validate();
        final isValidEmail = _emailFormKey.currentState!.validate();
        final isValidPassword = _passwordFormKey.currentState!.validate();

        if (isValidUsername && isValidEmail && isValidPassword) {
          var username = _usernameController.text.trim();
          var email = _emailController.text.trim();
          var password = _passwordController.text.trim();

          _singUp(context, username, email, password);
        }
      },
    );
  }

  Future _singUp(BuildContext context, String username, String email, String password) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.orange,
          ));
        });
    try {
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      user?.updateDisplayName(username);
      user?.updatePhotoURL('https://ih1.redbubble.net/image.2702052291.4780/st,small,845x845-pad,1000x1000,f8f8f8.jpg');
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
