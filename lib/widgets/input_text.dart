import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Validation{
  username,
  email,
  password
}

//TODO: add validation!
class InputText extends StatelessWidget{

  late final Icon _icon;
  late final TextEditingController _controller;
  late final String _hintText;
  late final bool _obscure;
  late final Validation _validation;
  late final GlobalKey _formKey;

  InputText(this._controller,this._hintText,this._icon, this._obscure,this._validation,this._formKey);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        key: _formKey,
        controller: _controller,
        obscureText: _obscure,
        style: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 20,fontWeight: FontWeight.w900),
        decoration: InputDecoration(
            hintStyle: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 20),
            hintText: _hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(
                  left: 10,
                  right: 10
              ),
              child: _icon,
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
        validator: (value){

          if(_validation == Validation.email && value != null){
            final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);

            if(value.isNotEmpty || emailValid) {
              return null;
            } else {
              return 'invalid email';
            }
          }else if(_validation == Validation.password && value != null){
            final bool passwordValid = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value);

            if(value.isNotEmpty || value.length > 8 || value.length < 15) {
              return null;
            } else {
              return 'invalid password';
            }
          }else if(_validation == Validation.username && value != null){

            if(value.isNotEmpty || value.length >= 2 || value.length < 20) {
              return null;
            } else {
              return 'invalid username';
            }
          }else{
            return 'value == null';
          }
        },
      ),
    );
  }
}