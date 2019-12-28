import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  var _p1d1 = 1;
  var _p1d2 = 1;

  var _p2d1 = 1;
  var _p2d2 = 1;

  bool _toss = false;
  var _p1toss = 0;
  var _p2toss = 0;

  var _turn = 0;
  bool _sel1 = false;
  bool _sel2 = false;

  var _box1;
  var _box2;

  List<int> _boxes = [
    Random().nextInt(11) + 2,
    Random().nextInt(11) + 2,
    Random().nextInt(11) + 2,
    Random().nextInt(11) + 2,
    Random().nextInt(11) + 2
  ];

  List<int> _boxstate = [
    0,
    0,
    0,
    0,
    0,
  ];

  List<Color> _playercol = [
    Colors.grey,
    Colors.green,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    _toss = false;
    _p1toss = 0;
    _p2toss = 0;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark));
      },
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Transform.rotate(
                          angle: 3.14159,
                          child: _p2toss == 0
                              ? _rollButton(Colors.red, 2)
                              : Container(),
                        ),
                        Transform.rotate(
                          angle: 3.14159,
                          child: _dice(2),
                        ),
                        _toss
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  (_box1 == 0 || _box2 == 0) || (_sel1 && _sel2)
                                      ? _lock(0)
                                      : _selectableLock(0),
                                  (_box1 == 1 || _box2 == 1) || (_sel1 && _sel2)
                                      ? _lock(1)
                                      : _selectableLock(1),
                                  (_box1 == 2 || _box2 == 2) || (_sel1 && _sel2)
                                      ? _lock(2)
                                      : _selectableLock(2),
                                  (_box1 == 3 || _box2 == 3) || (_sel1 && _sel2)
                                      ? _lock(3)
                                      : _selectableLock(3),
                                  (_box1 == 4 || _box2 == 4) || (_sel1 && _sel2)
                                      ? _lock(4)
                                      : _selectableLock(4),
                                ],
                              )
                            : _tossBar(),
                        _dice(1),
                        _p1toss == 0
                            ? _rollButton(Colors.green, 1)
                            : Container(),
                      ],
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(0, 40.0, 0, 0),
                    onPressed: () {
                      Navigator.pop(context);
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          systemNavigationBarIconBrightness: Brightness.dark));
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

  Widget _rollButton(Color color, var player) {
    return FlatButton(
      color: color,
      onPressed: () {
        setState(() {
          if (player == 1) {
            _p1d1 = Random().nextInt(6) + 1;
            _p1d2 = Random().nextInt(6) + 1;
          } else {
            _p2d1 = Random().nextInt(6) + 1;
            _p2d2 = Random().nextInt(6) + 1;
          }
          if (!_toss) {
            _p1toss = _p1d1 + _p1d2;
            _p2toss = _p2d1 + _p2d2;
          }
        });
      },
      child: Text("ROLL"),
    );
  }

  Widget _tossBar() {
    return Column(
      children: <Widget>[
        _p1toss != 0 && _p2toss != 0
            ? FlatButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    _p1d1 = 0;
                    _p1d2 = 0;
                    _p2d1 = 0;
                    _p2d2 = 0;
                    _toss = true;

                    _turn = _p1toss > _p2toss ? 1 : 2;

                    _p1toss = 0;
                    _p2toss = 0;
                  });
                },
                child: Text(
                  "START",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PLAYER 1: $_p1toss     PLAYER 2: $_p2toss",
              style: TextStyle(color: Colors.purple, fontSize: 23),
            ),
          ],
        ),
      ],
    );
  }

  Widget _lock(var box) {
    return Container(
      child: Icon(
        Icons.lock,
        size: 43,
        color: _playercol[_boxstate[box]],
      ),
      decoration: BoxDecoration(shape: BoxShape.circle),
    );
  }

  Widget _selectableLock(var box) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!_sel1 && !_sel2) {
            if (_turn == 1) {
              _sel1 = true;
              _box1 = box;
              _boxstate[box] = _turn;
              _turn = _turn == 1 ? 2 : 1;
            } else {
              _sel2 = true;
              _box2 = box;
              _boxstate[box] = _turn;
              _turn = _turn == 1 ? 2 : 1;
            }
          } else if (!_sel1) {
            _sel1 = true;
            _box1 = box;
            _boxstate[box] = _turn;
            _turn = _turn == 1 ? 2 : 1;
          } else {
            _sel2 = true;
            _box2 = box;
            _boxstate[box] = _turn;
            _turn = _turn == 1 ? 2 : 1;
          }
        });
      },
      child: Container(
        child: Icon(
          Icons.lock_outline,
          size: 43,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
    );
  }

  Widget _dice(var player) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        player == 1
            ? Expanded(child:Image.asset('assets/dice$_p1d1.jpeg'))
            : Expanded(child:Image.asset('assets/dice$_p2d1.jpeg')),
            SizedBox(width: 15,),
        player == 1
            ? Expanded(child:Image.asset('assets/dice$_p1d2.jpeg'))
            : Expanded(child:Image.asset('assets/dice$_p2d2.jpeg'))
      ],
    );
  }
}
