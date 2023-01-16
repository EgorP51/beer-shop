import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            padding: const EdgeInsets.only(
              top: 50
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              height: 400,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.yellow,width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _logo(),
                  _inputText(
                      Icon(Icons.email_outlined),
                      'Enter email',
                      _emailController,
                      false),
                  _inputText(
                      Icon(Icons.password_outlined),
                      'Enter password',
                      _passwordController,
                      true),
                  _submitButton()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _logo() {
    return Column(
      children: [
        Text('FucksMan',
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 50)),
        Text("CRAFT BEER SHOP",
            style: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 20)),
      ],
    );
  }

  Widget _inputText(Icon icon, String hintText,TextEditingController controller, bool obscure){
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 20, color: Colors.white),
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10
          ),
          child: icon,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFF77103),width: 4),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0x9BF77103),width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )
      ),
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
        backgroundColor: const Color(0xFFF77103),
      ),
      child: Text('sign in',
          style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 20)),
      onPressed: () {},
    );
  }
}
