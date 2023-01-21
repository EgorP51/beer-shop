import 'package:craft_store/data/models/beer_model.dart';
import 'package:flutter/material.dart';

class BeerScreen extends StatelessWidget{

  final BeerModel beerModel;
  const BeerScreen({super.key, required this.beerModel});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text('beer_screen'),
       backgroundColor: Colors.orange,
     ),
     body: Container(
       color: Colors.purpleAccent[100],
       padding: const EdgeInsets.all(20),
       alignment: Alignment.center,
       child: Image.network(beerModel.img),
     ),
   );
  }
}