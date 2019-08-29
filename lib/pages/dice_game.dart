import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

var _dice1Output = 0;
var _dice2Output = 0;

class _DiceGameState extends State<DiceGame> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/dicebg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _dice1Output == 0
                                ? Container()
                                : Text(
                                    "$_dice1Output",
                                    style: prefix0.TextStyle(
                                      fontSize: 132,
                                      color: Colors.orange[300],
                                    ),
                                  ),
                            _dice2Output == 0
                                ? Container()
                                : Text(
                                    "$_dice2Output",
                                    style: prefix0.TextStyle(
                                      fontSize: 132,
                                      color: Colors.blue[300],
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        FlatButton(
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              _dice1Output = Random().nextInt(6) + 1;
                              _dice2Output = Random().nextInt(6) + 1;
                            });
                          },
                          child: Text("ROLL"),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
