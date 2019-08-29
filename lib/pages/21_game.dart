import 'package:flutter/material.dart';

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Center(
          child: Text("21 game"),
        ),
      ),
    );
  }
}