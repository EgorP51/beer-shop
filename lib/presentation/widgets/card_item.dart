import 'package:craft_store/data/models/beer_model.dart';
import 'package:craft_store/presentation/screens/beer_screen.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {

  final BeerModel beerModel;

  CardItem({super.key,
    required this.beerModel
  });

  final List<Color> _colors = [
    Colors.purpleAccent,
    Colors.yellowAccent,
    Colors.cyanAccent,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BeerScreen(beerModel: beerModel,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10
        ),
        decoration: BoxDecoration(
          color: (_colors..shuffle()).first,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                beerModel.img,
                height: MediaQuery.of(context).size.height * 0.16,
              ),
              Center(
                child: Text(
                  beerModel.name,
                  style: const TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}