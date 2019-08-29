import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var _width = 0.0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/diceGame');
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/dice.jpg"), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              Container(
                width: _width,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacementNamed(context, '/21Game');
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/cards.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              )
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     Container(
          //       child: Text("DICE"),
          //     ),
          //     Container(
          //       child: Text("DICE"),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
