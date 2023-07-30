import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '/services/auth.dart';
import '/views/home.dart';
import '/views/sign_in.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const SignInScreen();
          }
        },
      ),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SignInScreen.routeName: (context) => const SignInScreen(),
      },
    ),
  );
}
