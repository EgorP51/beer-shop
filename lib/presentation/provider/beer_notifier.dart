import 'package:craft_store/utilities/utils.dart';
import 'package:flutter/material.dart';

import '../../data/models/beer_model.dart';

class BeerNotifier extends ChangeNotifier {
  final List<BeerModel> _beerModels = [];

  List<BeerModel> get beersModels => _beerModels;

  bool addToShoppingCart(BeerModel beer) {
    if (!_beerModels.contains(beer)) {
      _beerModels.add(beer);
      return true;
    } else {
      return false;
    }
  }

  void removeFromShoppingCart(BeerModel beer) {
    _beerModels.remove(beer);
  }
}
