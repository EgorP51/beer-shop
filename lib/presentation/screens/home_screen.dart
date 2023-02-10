import 'package:craft_store/data/database/database_operations.dart';
import 'package:craft_store/presentation/screens/shopping_cart_screen.dart';
import 'package:craft_store/presentation/widgets/card_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/beer_model.dart';
import '../../data/services/firebase_authorization.dart';
import '../widgets/logo.dart';
import 'order_screen.dart';

class HomeScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EBE3),
      body: StreamBuilder<List<BeerModel>>(
          stream: DatabaseOperations.readProductCollection(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              late final List<BeerModel> tempBeerModels = snapshot.data!;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    iconTheme:
                        const IconThemeData(color: Color(0xFFEB4531), size: 33),
                    centerTitle: true,
                    expandedHeight: 170,
                    pinned: true,
                    backgroundColor: const Color(0xFFF3EBE3),
                    flexibleSpace: FlexibleSpaceBar(
                        titlePadding: const EdgeInsets.only(top: 10),
                        centerTitle: true,
                        title: Logo(
                          size: 50,
                          color: const Color(0xFF212121),
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
                  color: Colors.amber,
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
      backgroundColor: const Color(0xFFF3EBE3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: MediaQuery.of(context).padding,
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF212121),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: const Color(0xFFEB4531),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(user?.photoURL ??
                          'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?w=2000'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Text(
                    user!.displayName ?? 'username == null',
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
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        const Divider(
          color: Color(0xFF212121),
          height: 20,
        ),
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
          color: Color(0xFF212121),
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
          color: Color(0xFF212121),
          height: 20,
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: const Text('More about us'),
          onTap: () {},
        ),
        const Divider(
          color: Color(0xFF212121),
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
          color: Color(0xFF212121),
          height: 20,
        ),
      ],
    );
  }
}
