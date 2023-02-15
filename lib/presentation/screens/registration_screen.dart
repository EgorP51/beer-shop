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

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFF3EBE3),
          body: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 400,
              width: 330,
              decoration: BoxDecoration(
                color: const Color(0xFFF3EBE3),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
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

  Widget _goToLoginScreen(BuildContext context) {
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
          style: GoogleFonts.russoOne(
              fontSize: 17, color: Colors.black54, fontWeight: FontWeight.w600),
        ));
  }

  Widget _returnButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: const Color(0xFFEB4531),
      ),
      child: Text('sign up',
          style: GoogleFonts.russoOne(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600)),
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
                  color: Color(0xFFEB4531),
                ));
              });
          FirebaseAuthorization.signUp(email, password, username);
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
      },
    );
  }
}
