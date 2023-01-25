import 'package:craft_store/presentation/provider/beer_notifier.dart';
import 'package:craft_store/presentation/screens/home_screen.dart';
import 'package:craft_store/presentation/screens/login_screen.dart';
import 'package:craft_store/utilities/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BeerNotifier(),
      child: MaterialApp(
          scaffoldMessengerKey: Utils.messendgerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          )),
    );
  }
}
