import 'package:craft_store/data/models/beer_model.dart';
import 'package:craft_store/presentation/screens/beer_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatelessWidget {

  final BeerModel beerModel;

  CardItem({super.key,
    required this.beerModel
  });

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
      child: FittedBox(
        fit: BoxFit.contain,
        child: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xFFEED9D4),
                      radius: 75,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE8CBC3),
                        radius: 55,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFE7BEB6),
                          radius: 35,
                        ),
                      ),
                    ),
                    Image.network(
                      beerModel.img,
                      height: 180,
                    )
                  ],
                ),
                FittedBox(
                    fit: BoxFit.fill,
                    child: Text(beerModel.name,style: GoogleFonts.russoOne(
                        color: const Color(0xFF212121),
                        fontSize: 30,
                        fontWeight: FontWeight.w600),),
                  ),
              ],
            ),
          ),
      ),
    );
  }
}