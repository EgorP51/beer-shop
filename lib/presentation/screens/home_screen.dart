import 'package:craft_store/presentation/widgets/card_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/beer_model.dart';
import '../../data/services/firebase_authorization.dart';


class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  final List<BeerModel> _tempBeerModels = List.filled(
      20,
      BeerModel(
          'https://firebasestorage.googleapis.com/v0/b/beer-shop-dfe80.appspot.com/o/pngwing.com(1).png?alt=media&token=646d67b7-fdfa-4bee-a904-3ce49ef2cc82',
          '0.75',
          '5',
          'light',
          'FucksMan',
          '80',
          'Test description',
          'beer'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'F u c k s M a n',
              style: GoogleFonts.comfortaa(color: Colors.white, fontSize: 23),
            ),
            centerTitle: true,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            backgroundColor: Colors.orange,
          ),
          _body()
        ],
      ),
      drawer: _drawer(context),
    );
  }

  Widget _body() {
    return SliverPadding(
      padding: const EdgeInsetsDirectional.all(15),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
            (context, index) => CardItem(beerModel: _tempBeerModels[index]),
            childCount: _tempBeerModels.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 0.85),
      ),
    );
  }

  Widget _drawer(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsetsDirectional.only(top: 25),
              height: 190,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(user?.photoURL ??
                        'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000'),
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    user!.displayName ?? 'username == null',
                    style: GoogleFonts.comfortaa(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    user!.email!,
                    style: GoogleFonts.comfortaa(
                        color: Colors.white70, fontSize: 15),
                  )
                ],
              )),
          _buildMenuItems(),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.app_registration_outlined),
          title: const Text('My orders'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Shopping cart'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('More about us'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.output_outlined),
          title: const Text('Sign out'),
          onTap: () {
            FirebaseAuthorization.signOut();
          },
        ),
      ],
    );
  }
}
