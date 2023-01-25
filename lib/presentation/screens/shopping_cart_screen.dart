import 'package:craft_store/presentation/provider/beer_notifier.dart';
import 'package:craft_store/presentation/widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF3EBE3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFEB4531), size: 33),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Shopping Cart',
            style: GoogleFonts.grenzeGotisch(
                color: const Color(0xFF212121),
                fontSize: 30,
                fontWeight: FontWeight.w600)),
        elevation: 0,
      ),
      body: beerNotifier.beersModels.isEmpty
          ? Center(
              child: Text('No products yet',
                  style: GoogleFonts.russoOne(
                      color: const Color.fromARGB(255, 95, 95, 95),
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            )
          : Container(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: beerNotifier.beersModels.length,
                itemBuilder: (context, index) {
                  return ShoppingCartItem(
                      beer: beerNotifier.beersModels[index]);
                },
              ),
            ),
    );
  }
}
