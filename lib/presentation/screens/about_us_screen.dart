import 'package:craft_store/presentation/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.darkAppColor,
      appBar: AppBar(
        iconTheme: Constants.iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Who are we?',
            style: GoogleFonts.grenzeGotisch(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/fucksLogo.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('We are FucksMan!',
                  style: GoogleFonts.russoOne(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 20,
              ),
              Text(
                  'A craft alcohol brand with a huge history. On our way of development, we faced a lot of problems, coping with which we and the quality of our products became better and better. Now we are leaders in the craft alcohol market. We are glad that you chose our store. Have a good time!))',
                  style: GoogleFonts.russoOne(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w500)),
              const SizedBox(
                height: 20,
              ),
              Text('Drinking alcohol is allowed only from the age of 18!',
                  style: GoogleFonts.russoOne(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
