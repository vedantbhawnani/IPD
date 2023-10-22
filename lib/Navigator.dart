//importing pages

// ignore_for_file: prefer_const_constructors

//importing packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login_page/Favorites.dart';
import 'package:login_page/HomePage.dart';
import 'package:login_page/Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
} //Stateful Widget

class _HomePageState extends State<HomePage> {
  int index = 0;

  final screens = [
    MyMapApp(),
    Favorites(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      //------------------------------Body------------------------START----------------
      body: screens[index],
      //------------------------------Body------------------------ENDS----------------
      //---------------------------Botton Nav Bar-----------------START-------------
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.transparent,
        color: Colors.deepPurple.shade200,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.bounceIn,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ), //CurvedNavigationbar
      //---------------------------Botton Nav Bar-----------------ENDS-------------
    ); //Scaffold
  } //build
} //setState
