import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_store/data/models/beer_model.dart';

class DatabaseOperations{

  static Stream<List<BeerModel>> readProductCollection() {
    return FirebaseFirestore.instance
        .collection('product collection')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BeerModel.fromJson(doc.data()))
            .toList());
  }
}