import 'package:craft_store/data/database/database_operations.dart';
import 'package:craft_store/data/models/order_model.dart';
import 'package:craft_store/data/services/email_sender.dart';
import 'package:craft_store/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/models/beer_model.dart';

class BeerNotifier extends ChangeNotifier {
  final List<BeerModel> _beerModels = [];
  final user = FirebaseAuth.instance.currentUser;
  final Map<BeerModel, int> _itemCount = {};
  int _totalPrice = 0;

  List<BeerModel> get beersModels => _beerModels;
  int get totalCount => _totalPrice;

  bool addToShoppingCart(BeerModel beer) {
    if (!_beerModels.contains(beer)) {
      _beerModels.add(beer);
      _totalPrice += int.parse(beer.price);
      _itemCount[beer] = int.parse(beer.price);

      return true;
    } else {
      return false;
    }
  }

  void removeFromShoppingCart(BeerModel beer) {
    _beerModels.remove(beer);
    _totalPrice -= _itemCount[beer]!;
    notifyListeners();
  }

  void addItem(BeerModel beer) {
    _itemCount[beer] = _itemCount[beer]! + int.parse(beer.price);
    _totalPrice += int.parse(beer.price);
    notifyListeners();
  }

  void removeItem(BeerModel beer) {
    if (_itemCount[beer]! > int.parse(beer.price)) {
      _itemCount[beer] = _itemCount[beer]! - int.parse(beer.price);
      _totalPrice -= int.parse(beer.price);
    }
    notifyListeners();
  }

  int oneBeerTypeCount(BeerModel beer) =>
      _itemCount[beer]! ~/ int.parse(beer.price);

  void sendOrderForProcessing() {
    final List<BeerOrderModel> orderList = [];

    for (BeerModel beer in _beerModels) {
      orderList.add(BeerOrderModel(beer.name, oneBeerTypeCount(beer)));
    }
    DatabaseOperations.writeOrderToDB(user!.uid, orderList, _totalPrice);

    var message =
        'Username: ${user!.displayName},\nUser id: ${user!.uid},\nTotal price: $_totalPrice,\nItems: ';
    for (BeerOrderModel beerOrderModel in orderList) {
      message +=
          '${beerOrderModel.beerName} (${beerOrderModel.bottlesNumber} bottles)\n';
    }

    EmailSender.sendEmail(
        name: user!.displayName!,
        email: user!.email!,
        subject: 'FucksMan, new order!',
        message: message);
    Utils.showSnackBar('Order sent for processing', SnackBarType.success);

    _beerModels.clear();
    _itemCount.clear();
    _totalPrice = 0;
  }
}
