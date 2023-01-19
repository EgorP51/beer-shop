import 'package:craft_store/main.dart';
import 'package:craft_store/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/firebase_authorization.dart';
import '../widgets/input_text.dart';
import '../widgets/logo.dart';


class LoginScreen extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  Logo(),
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
                      obscure: true,
                      validation: Validation.password,
                      formKey: _passwordFormKey),
                  _goToRegistration(context),
                  _signInButton(context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _signInButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          backgroundColor: const Color(0xFFF77103),
        ),
        child: Text('sign in',
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20)),
        onPressed: () {
          final isValidEmail = _emailFormKey.currentState!.validate();
          final isValidPassword = _passwordFormKey.currentState!.validate();

          if (isValidEmail && isValidPassword) {
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
            FirebaseAuthorization.signIn(email, password);
            navigatorKey.currentState!.popUntil((route) => route.isFirst);
          }
        });
  }

  Widget _goToRegistration(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RegistrationScreen(),
            ),
          );
        },
        child: Text(
          "No account? Sign up!",
          style: GoogleFonts.comfortaa(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800),
        ));
  }
}
