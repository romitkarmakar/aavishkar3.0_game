import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/rendering.dart';

import './pages/home_page.dart';
import './pages/dice_game.dart';
import './pages/21_game.dart';
import './pages/store.dart';

void main() {
  //debugPaintSizeEnabled = true;
  //debugPaintBaselinesEnabled = true;
  //debugPaintPointersEnabled = true;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
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
          iconTheme: IconThemeData(color: Colors.grey),
          buttonTheme: ButtonThemeData(buttonColor: Colors.grey),
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.grey),
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/dicegame": (BuildContext context) => DiceGame(),
        "/21game": (BuildContext context) => CardGame(),
        "/store": (BuildContext context) => TokenStore(),
      },
    );
  }
}
