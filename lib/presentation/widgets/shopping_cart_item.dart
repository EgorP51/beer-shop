import 'package:craft_store/data/models/beer_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/beer_notifier.dart';

class ShoppingCartItem extends StatelessWidget {
  final BeerModel beer;
  const ShoppingCartItem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        onDismissed: (_) {
          beerNotifier.removeFromShoppingCart(beer);
        },
        background: Container(
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.centerRight,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: Card(
            elevation: 10,
            color: const Color.fromARGB(255, 248, 244, 240),
            child: Container(
              padding: const EdgeInsets.only(left: 13),
              height: 100,
              alignment: Alignment.center,
              child: ListTile(
                  leading: Image.network(
                    beer.img,
                    height: 90,
                  ),
                  title: SizedBox(
                    width: double.infinity,
                    child: Text(
                      beer.name,
                      style: GoogleFonts.russoOne(
                          fontSize: 25,
                          color: const Color(0xFFEB4531),
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text('${beer.price}₴',
                      style: GoogleFonts.russoOne(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  trailing: _counter(beerNotifier)),
            )));
  }

  Widget _counter(BeerNotifier beerNotifier) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            beerNotifier.removeItem(beer);
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 15,
        ),
        Text(
          beerNotifier.oneBeerTypeCount(beer).toString(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        IconButton(
          onPressed: () {
            beerNotifier.addItem(beer);
          },
          icon: const Icon(Icons.arrow_forward_ios),
          iconSize: 15,
        )
      ],
    );
  }
}
