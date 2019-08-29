import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import './pages/home_page.dart';
import './pages/dice_game.dart';
import './pages/21_game.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.black
      ),
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/diceGame": (BuildContext context) => DiceGame(),
        "/21game": (BuildContext context) => CardGame(),
      },
    );
  }
}