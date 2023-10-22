// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     brightness: Brightness.light,
      //     primaryColor: Colors.red,
      //     primarySwatch: Colors.green),
      // darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // routes: {
      //   '/login': (context) => LoginPage(),
      //   '/signup': (context) => SignUp(),
      // '/home': (context) => MyMapApp(),
      // '/favorites': (context) => Favorites(),
      // '/settings': (settings) => Settings(),
      // },
    );
  }
}
