import 'package:craft_store/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  fit: BoxFit.cover
              )
          ),
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

                  InputText(_usernameController, 'Enter your username', const Icon(Icons.supervised_user_circle), false,Validation.username,_userFormKey),
                  InputText(_emailController, 'Enter email', const Icon(Icons.email_outlined), false,Validation.email,_emailFormKey),
                  InputText(_passwordController, 'Enter password', const Icon(Icons.password_outlined), true,Validation.password,_passwordFormKey),
                  const SizedBox(height: 30,),
                  _returnButton(context)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  Widget _returnButton(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: const Color(0xFFF77103),
      ),
      child: Text('return to login screen',
          style: GoogleFonts.comfortaa(
              color: Colors.white, fontSize: 20)),
      onPressed: () {
        final isValidUsername = _userFormKey.currentState!.validate();
        final isValidEmail = _emailFormKey.currentState!.validate();
        final isValidPassword = _passwordFormKey.currentState!.validate();

        if(isValidUsername && isValidEmail && isValidPassword) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}