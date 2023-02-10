import 'package:craft_store/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final OrderModel orderModel;
  const OrderItem({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'order id: ${orderModel.orderId}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text('items: ${_orderItems()}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text('total price: ${orderModel.totalPrice}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  String _orderItems() {
    String items = '';
    for (BeerOrderModel beerOrderModel in orderModel.order) {
      items +=
          '${beerOrderModel.beerName}(${beerOrderModel.bottlesNumber} bottles), ';
    }
    return items;
  }
}
