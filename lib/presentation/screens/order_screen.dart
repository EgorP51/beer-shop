import 'package:craft_store/data/database/database_operations.dart';
import 'package:craft_store/data/models/order_model.dart';
import 'package:craft_store/presentation/constants.dart';
import 'package:craft_store/presentation/widgets/order_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightAppColor,
      appBar: AppBar(
        iconTheme: Constants.iconTheme,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Orders',
            style: GoogleFonts.grenzeGotisch(
                color: Constants.darkAppColor,
                fontSize: 30,
                fontWeight: FontWeight.w600)),
        elevation: 0,
      ),
      body: StreamBuilder<List<OrderModel?>>(
          stream: DatabaseOperations.readOrderCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final orderList = snapshot.data!
                  .where((element) => element!.userId == user!.uid)
                  .toList();
              return orderList.isEmpty
                  ? Center(
                      child: Text('No orders yet',
                          style: GoogleFonts.russoOne(
                              color: const Color.fromARGB(255, 95, 95, 95),
                              fontSize: 30,
                              fontWeight: FontWeight.w600)),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12),
                      child: ListView.builder(
                        itemCount: orderList.length,
                        itemBuilder: (context, index) {
                          return OrderItem(
                            orderModel: orderList[index]!,
                          );
                        },
                      ),
                    );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Constants.redAppColor,
                ),
              );
            }
          }),
    );
  }
}
