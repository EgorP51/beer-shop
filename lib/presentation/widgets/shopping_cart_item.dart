import 'package:craft_store/data/models/beer_model.dart';
import 'package:flutter/material.dart';

class ShoppingCartItem extends StatelessWidget {
  final BeerModel beer;
  const ShoppingCartItem({super.key, required this.beer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      leading: Image.network(beer.img),
      title: Text(beer.name),
    );
  }
}
