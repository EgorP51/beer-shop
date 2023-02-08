class OrderModel {
  final String orderId;
  final String userId;
  final List<BeerOrderModel> order;
  final int totalPrice;

  OrderModel(this.orderId, this.userId, this.order, this.totalPrice);

  static OrderModel fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['order'] ?? [];

    final order = list.map((e) => BeerOrderModel.fromJson(e)).toList();
    return OrderModel(
        json['orderId'], json['userId'], order, json['totalPrice']);
  }

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'userId': userId,
        'order': order.map((e) => e.toJson()).toList(),
        'totalPrice': totalPrice
      };
}

class BeerOrderModel {
  final String beerName;
  final int bottlesNumber;

  BeerOrderModel(this.beerName, this.bottlesNumber);

  static BeerOrderModel fromJson(Map<String, dynamic> json) =>
      BeerOrderModel(json['beerName'], json['bottleNumber']);

  Map<String, dynamic> toJson() =>
      {'beerName': beerName, 'bottleNumber': bottlesNumber};
}
