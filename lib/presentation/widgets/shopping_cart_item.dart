import 'package:craft_store/data/models/beer_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartItem extends StatelessWidget {
  final BeerModel beer;
  const ShoppingCartItem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: const Color.fromARGB(255, 248, 244, 240),
      child: Container(
        height: 100,
        alignment: Alignment.center,
        child: ListTile(
          leading: Image.network(
            beer.img,
            height: 90,
          ),
          title: Text(beer.name,
              style: GoogleFonts.russoOne(
                  fontSize: 30,
                  color: const Color(0xFFEB4531),
                  fontWeight: FontWeight.w500)),
          subtitle: Text('${beer.price}₴',
              style: GoogleFonts.russoOne(
                  fontSize: 20, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
