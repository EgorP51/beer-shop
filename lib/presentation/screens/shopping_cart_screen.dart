import 'package:craft_store/presentation/constants.dart';
import 'package:craft_store/presentation/provider/beer_notifier.dart';
import 'package:craft_store/presentation/widgets/shopping_cart_item.dart';
import 'package:craft_store/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);
    return Scaffold(
      backgroundColor: Constants.lightAppColor,
      appBar: AppBar(
        iconTheme: Constants.iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Shopping Cart',
            style: GoogleFonts.grenzeGotisch(
                color: Constants.darkAppColor,
                fontSize: 30,
                fontWeight: FontWeight.w600)),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,),
            onPressed: () {
              Utils.showToast(text: 'Swipe an item to remove it from the cart');
            },
          )
        ],
      ),
      body: beerNotifier.beersModels.isEmpty
          ? Center(
              child: Text('No products yet',
                  style: GoogleFonts.russoOne(
                      color: const Color.fromARGB(255, 95, 95, 95),
                      fontSize: 30,
                      fontWeight: FontWeight.w600)),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: ListView.builder(
                      itemCount: beerNotifier.beersModels.length,
                      itemBuilder: (context, index) {
                        return ShoppingCartItem(
                            beer: beerNotifier.beersModels[index]);
                      },
                    ),
                  ),
                  _totalCount(context),
                  const SizedBox(height: 10),
                  _orderButton(context),
                ],
              ),
            ),
    );
  }

  Widget _totalCount(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);
    return Container(
      height: 70,
      alignment: Alignment.center,
      color: const Color.fromARGB(255, 225, 210, 196),
      child: Text(
        'Total price: ${beerNotifier.totalCount}',
        style: GoogleFonts.russoOne(
            fontSize: 25, color: Colors.black54, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _orderButton(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(70),
          backgroundColor: Constants.redAppColor,
        ),
        onPressed: () {
          beerNotifier.sendOrderForProcessing();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Order now ',
              style: GoogleFonts.russoOne(
                  fontSize: 25,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
            const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black54,
              size: 25,
            )
          ],
        ));
  }
}
