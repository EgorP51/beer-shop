import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  double size;
  Color color;
  Logo({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text('FucksMan',
        style: GoogleFonts.grenzeGotisch(
            color: color, fontSize: size, fontWeight: FontWeight.w500));
  }
}
