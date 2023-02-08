import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_store/data/models/beer_model.dart';
import 'package:craft_store/data/models/order_model.dart';

class DatabaseOperations {
  static Stream<List<BeerModel>> readProductCollection() {
    return FirebaseFirestore.instance
        .collection('product collection')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => BeerModel.fromJson(doc.data()))
            .toList());
  }

  static Future<void> writeOrderToDB(
      String uid, List<BeerOrderModel> orderList, int totalPrice) async {
    final orderDoc = FirebaseFirestore.instance.collection('orders').doc();
    final OrderModel order =
        OrderModel(orderDoc.id, uid, orderList, totalPrice);
    final json = order.toJson();
    await orderDoc.set(json);
  }
}
