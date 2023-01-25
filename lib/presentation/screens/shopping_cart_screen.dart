import 'package:craft_store/presentation/provider/beer_notifier.dart';
import 'package:craft_store/presentation/widgets/shopping_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var beerNotifier = Provider.of<BeerNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: beerNotifier.beersModels.length,
          itemBuilder: (context, index) {
            return ShoppingCartItem(beer: beerNotifier.beersModels[index]);
          },
        ),
      ),
    );
  }
}
