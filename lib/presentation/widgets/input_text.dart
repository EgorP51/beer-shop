import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Validation { username, email, password }

class InputText extends StatelessWidget {
  late final Icon _icon;
  late final TextEditingController _controller;
  late final String _hintText;
  late final bool _obscure;
  late final Validation _validation;
  late final GlobalKey _formKey;

  InputText(
      {super.key,
      required controller,
      required hintText,
      required icon,
      required obscure,
      required validation,
      required formKey}) {
    _controller = controller;
    _icon = icon;
    _hintText = hintText;
    _obscure = obscure;
    _validation = validation;
    _formKey = formKey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: _controller,
        obscureText: _obscure,
        style: GoogleFonts.russoOne(
            color: const Color(0xBB212121),
            fontSize: 20,
            fontWeight: FontWeight.w900),
        decoration: InputDecoration(
            hintStyle: GoogleFonts.russoOne(
                fontSize: 22,
                color: const Color(0xBB212121),
                fontWeight: FontWeight.w400),
            hintText: _hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: _icon,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Color(0xFFEB4531), width: 4),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xD5EB4531), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )),
        validator: (value) {
          if (_validation == Validation.email && value != null) {
            final bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value);

            if (value.isNotEmpty && emailValid) {
              return null;
            } else {
              return 'invalid email';
            }
          } else if (_validation == Validation.password && value != null) {
            final bool passwordValid = RegExp(
                    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$')
                .hasMatch(value);

            if (value.isNotEmpty &&
                passwordValid &&
                value.length >= 6 &&
                value.length < 15) {
              return null;
            } else {
              return 'password must contain\nsix or more characters, one letter and one number';
            }
          } else if (_validation == Validation.username && value != null) {
            if (value.isNotEmpty && value.length >= 2 && value.length < 20) {
              return null;
            } else {
              return 'invalid username';
            }
          } else {
            return 'value == null';
          }
        },
      ),
    );
  }
}
