import 'package:craft_store/data/models/beer_model.dart';
import 'package:flutter/material.dart';

class BeerScreen extends StatelessWidget{

  final BeerModel beerModel;
  const BeerScreen({required this.beerModel});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('beer_screen'),
     ),
   );
  }
}