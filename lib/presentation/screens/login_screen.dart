import 'package:craft_store/main.dart';
import 'package:craft_store/presentation/constants.dart';
import 'package:craft_store/presentation/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/services/firebase_authorization.dart';
import '../widgets/input_text.dart';
import '../widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightAppColor,
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 400,
          width: 330,
          decoration: BoxDecoration(
            color: Constants.lightAppColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Logo(
                size: 60,
                color: Constants.darkAppColor,
              ),
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
    );
  }

  Widget _signInButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
          backgroundColor: Constants.redAppColor,
        ),
        child: Text('sign in',
            style: GoogleFonts.russoOne(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
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
                    color: Constants.redAppColor,
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
          style: GoogleFonts.russoOne(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800),
        ));
  }
}
