import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String img;
  final String name;
  final String price;
  final String alcoholContent;

  const CardItem({
    required this.img,
    required this.name,
    required this.price,
    required this.alcoholContent
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10
      ),
      decoration: const BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              img,
              height: 150,
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$price ₴',style: const TextStyle(fontSize: 30)),
              Text('$alcoholContent %',style: const TextStyle(fontSize: 30)),
            ],
          ),
        )
      ]),
    );
  }
}