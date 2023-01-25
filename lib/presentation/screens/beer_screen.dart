import 'package:craft_store/data/models/beer_model.dart';
import 'package:craft_store/presentation/provider/beer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/logo.dart';

int bottleNumber = 1;

class BeerScreen extends StatelessWidget {
  final BeerModel beerModel;
  const BeerScreen({super.key, required this.beerModel});

  @override
  Widget build(BuildContext context) {
    var beerProvider = Provider.of<BeerNotifier>(context);

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF212121),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Color(0xFFEB4531), size: 33),
            backgroundColor: Colors.transparent,
            title: Logo(
              size: 40,
              color: Colors.white,
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xFFEB4531),
                          radius: 120,
                        ),
                        Image.network(
                          beerModel.img,
                          height: 300,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(beerModel.name,
                      style: GoogleFonts.russoOne(
                          fontSize: 40,
                          color: const Color(0xFFEB4531),
                          fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    beerModel.description,
                    style: GoogleFonts.gothicA1(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _parameters(),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(),
                      _addToShoppingCartButton(beerProvider),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _addToShoppingCartButton(BeerNotifier beerProvider) {
    return Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(20, 50),
            backgroundColor: const Color(0xFFEB4531),
          ),
          onPressed: () {
            beerProvider.addToShoppingCart(beerModel);
          },
          child: const Icon(Icons.shopping_cart),
        ));
  }

  Widget _parameters() {
    var style = GoogleFonts.gothicA1(
        fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w400);
    return Column(
      children: [
        const Divider(
          color: Colors.white70,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Volume',
              style: style,
            ),
            Text(
              '${beerModel.volume}L',
              style: style,
            ),
          ],
        ),
        const Divider(
          color: Colors.white70,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Alcohol Content',
              style: style,
            ),
            Text(
              "${beerModel.alcoholContent}%",
              style: style,
            ),
          ],
        ),
        const Divider(
          color: Colors.white70,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Color',
              style: style,
            ),
            Text(
              beerModel.color,
              style: style,
            ),
          ],
        ),
        const Divider(
          color: Colors.white70,
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price',
              style: style,
            ),
            Text(
              '${beerModel.price}₴',
              style: style,
            ),
          ],
        ),
        const Divider(
          color: Colors.white70,
          height: 20,
        ),
      ],
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            setState(() {
              if (bottleNumber > 1) bottleNumber--;
            });
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black87,
          ),
        ),
        Text(
          ' $bottleNumber ',
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
        FloatingActionButton(
          backgroundColor: Colors.white70,
          onPressed: () {
            setState(() {
              bottleNumber++;
            });
          },
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
