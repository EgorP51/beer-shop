import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/services/firebase_authorization.dart';
import '../../main.dart';
import '../widgets/input_text.dart';
import 'login_screen.dart';


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
                  _goToLoginScreen(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
                  _returnButton(context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _goToLoginScreen(BuildContext context){
    //I already have an account
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        child: Text(
          "I already have an account",
          style: GoogleFonts.comfortaa(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800),
        ));
  }

  Widget _returnButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: const Color(0xFFF77103),
      ),
      child: Text('sign up',
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20)),
      onPressed: () {
        final isValidUsername = _userFormKey.currentState!.validate();
        final isValidEmail = _emailFormKey.currentState!.validate();
        final isValidPassword = _passwordFormKey.currentState!.validate();

        if (isValidUsername && isValidEmail && isValidPassword) {

          var username = _usernameController.text.trim();
          var email = _emailController.text.trim();
          var password = _passwordController.text.trim();

          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    ));
              });
          FirebaseAuthorization.signUp(email, password, username);
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
      },
    );
  }
}
