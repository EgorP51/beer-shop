import 'package:craft_store/data/models/beer_model.dart';
import 'package:craft_store/presentation/constants.dart';
import 'package:craft_store/presentation/screens/beer_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatelessWidget {
  final BeerModel beerModel;
  const CardItem({super.key, required this.beerModel});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.28;
    final wight = MediaQuery.of(context).size.width * 0.4;

    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BeerScreen(
                beerModel: beerModel,
              ),
            ),
          );
        },
        child: UnconstrainedBox(
          child: SizedBox(
            height: height,
            width: wight,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: height * 0.8,
                    width: wight,
                    child: Stack(
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
                          height: height * 0.9,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white54,
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      beerModel.name,
                      style: GoogleFonts.russoOne(
                          color: Constants.darkAppColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
