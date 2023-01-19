import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('FucksMan',
            style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 50)),
        Text("CRAFT BEER SHOP",
            style: GoogleFonts.comfortaa(color: Colors.white70, fontSize: 20)),
      ],
    );
  }

}