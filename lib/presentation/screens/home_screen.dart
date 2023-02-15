import 'package:craft_store/data/database/database_operations.dart';
import 'package:craft_store/presentation/constants.dart';
import 'package:craft_store/presentation/screens/about_us_screen.dart';
import 'package:craft_store/presentation/screens/shopping_cart_screen.dart';
import 'package:craft_store/presentation/widgets/card_item.dart';
import 'package:craft_store/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/beer_model.dart';
import '../../data/services/firebase_authorization.dart';
import '../widgets/logo.dart';
import 'order_screen.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightAppColor,
      body: StreamBuilder<List<BeerModel>>(
          stream: DatabaseOperations.readProductCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              late final List<BeerModel> tempBeerModels = snapshot.data!;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    iconTheme: Constants.iconTheme,
                    centerTitle: true,
                    expandedHeight: 150,
                    pinned: true,
                    backgroundColor: Constants.lightAppColor,
                    flexibleSpace: FlexibleSpaceBar(
                        titlePadding: const EdgeInsets.only(top: 10),
                        centerTitle: true,
                        title: Logo(
                          size: 50,
                          color: Constants.darkAppColor,
                        )),
                  ),
                  _body(tempBeerModels)
                ],
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
      drawer: _drawer(context),
    );
  }

  Widget _body(List<BeerModel> tempBeerModels) {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.all(20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (context, index) => CardItem(beerModel: tempBeerModels[index]),
            childCount: tempBeerModels.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 0.7),
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      backgroundColor: Constants.lightAppColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: MediaQuery.of(context).padding,
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Constants.darkAppColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Constants.redAppColor,
                    child: InkWell(
                      onTap: () {
                        Utils.showToast(
                            text: 'Photo change is currently not available');
                      },
                      child: const CircleAvatar(
                        radius: 40.0,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/originals/73/9f/50/739f5047dd55a47d50dd5f27a11c0c29.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Text(
                    user!.displayName ?? user!.email!.split("@").first,
                    style: GoogleFonts.russoOne(
                        fontSize: 30,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    user!.email!,
                    style: GoogleFonts.russoOne(
                      fontSize: 15,
                      color: Colors.white60,
                    ),
                  )
                ],
              )),
          _buildMenuItems(context),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.app_registration_outlined),
          title: const Text('My orders'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => OrderScreen()),
            );
          },
        ),
        const Divider(
          color: Constants.darkAppColor,
          height: 20,
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Shopping cart'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const ShoppingCartScreen()),
            );
          },
        ),
        const Divider(
          color: Constants.darkAppColor,
          height: 20,
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('More about us'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AboutUsScreen()),
            );
          },
        ),
        const Divider(
          color: Constants.darkAppColor,
          height: 20,
        ),
        ListTile(
          leading: const Icon(Icons.output_outlined),
          title: const Text('Sign out'),
          onTap: () {
            FirebaseAuthorization.signOut();
          },
        ),
        const Divider(
          color: Constants.darkAppColor,
          height: 20,
        ),
      ],
    );
  }
}
