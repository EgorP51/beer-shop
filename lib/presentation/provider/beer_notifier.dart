import 'package:flutter/material.dart';

import '../../data/models/beer_model.dart';

class BeerNotifier extends ChangeNotifier {
  final List<BeerModel> _beerModels = [];
  final _itemCount = {};
  int _totalCount = 0;

  List<BeerModel> get beersModels => _beerModels;
  int get totalCount => _totalCount;

  bool addToShoppingCart(BeerModel beer) {
    if (!_beerModels.contains(beer)) {
      _beerModels.add(beer);
      _totalCount += int.parse(beer.price);
      _itemCount[beer] = int.parse(beer.price);

      return true;
    } else {
      return false;
    }
  }

  void addItem(BeerModel beer) {
    _itemCount[beer] += int.parse(beer.price);
    _totalCount += int.parse(beer.price);
    notifyListeners();
  }

  void removeItem(BeerModel beer) {
    if (_itemCount[beer] > int.parse(beer.price)) {
      _itemCount[beer] -= int.parse(beer.price);
      _totalCount -= int.parse(beer.price);
    }
    notifyListeners();
  }

  int oneBeerTypeCount(BeerModel beer) =>
      (_itemCount[beer] / int.parse(beer.price)).toInt();

  void removeFromShoppingCart(BeerModel beer) {
    _beerModels.remove(beer);
    _totalCount += int.parse(beer.price);
    notifyListeners();
  }
}
