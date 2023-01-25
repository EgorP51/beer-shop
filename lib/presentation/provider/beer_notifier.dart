import 'package:flutter/material.dart';

import '../../data/models/beer_model.dart';

class BeerNotifier extends ChangeNotifier {
  final List<BeerModel> _beerModels = [];

  List<BeerModel> get beersModels => _beerModels;

  void addToShoppingCart(BeerModel beer) {
    _beerModels.add(beer);
  }

  void removeFromShoppingCart(BeerModel beer) {
    _beerModels.remove(beer);
  }
}
