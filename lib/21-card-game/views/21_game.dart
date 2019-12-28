import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class CardGame extends StatefulWidget {
  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  var player;
  int _p1c1=1;
  var _p1c2=1;
  var _p1c3=1;
  var _p1c4=1;
  var _p1c5=1;
  var _p1c6=1;
  var _p2c1=1;
  var _p2c2=1;
  var _p2c3=1;
  var _p2c4=1;
  var _p2c5=1;
  var _p2c6=1;
  int i=0;
  var j;

  bool hit1=false;
  bool hit2=false;

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
              image: AssetImage('assets/fcards.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0)
                        ),
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(15.0),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              _button(Colors.green, 'HIT', true,2),
                              SizedBox(
                                width: 10,
                              ),
                              _button(Colors.red, 'STAND', false,2)
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)),
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(2.0),
                            child: _card2(_p2c1, _p2c2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _start(),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)),
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(2.0),
                            child:_card1(_p1c1, _p2c2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          
                          Row(
                            children: <Widget>[
                              _button(Colors.green, 'HIT', true,1),
                              SizedBox(
                                width: 10,
                              ),
                              _button(Colors.red, 'STAND', false,1)
                            ],
                          )
                        ],
                      ),
                    )
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
                      color: Color(0xffff9e80),
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



Widget _button(Color color, String label, bool state, var player)
{
  return RaisedButton(
    color: color,
    child: Text(
      '$label',
    ),
    onPressed: (){
      state==true
      ?Hit(player)
      :Stand();
    },
  );
}
Hit(var player){
  setState(()
      {
        i++;
        if (player == 1 && i==1) {
          hit1=true;
            _p1c3 = Random().nextInt(52) + 1;
            j=_p1c3;
          } 
        else if (player == 1 && i==2) {
          hit1=true;
            _p1c4 = Random().nextInt(52) + 1;
            j=_p1c4;
          }
        else if (player == 1 && i==3) {
          hit1=true;
            _p1c5 = Random().nextInt(52) + 1;
            j=_p1c5;
          }
        else if (player == 1 && i==4) {
          hit1=true;
            _p1c6 = Random().nextInt(52) + 1;
            j=_p1c6;
          }
        else if (player==2 && i==1){
            hit2=true;
            _p2c3 = Random().nextInt(52) + 1;
            j=_p2c3;
          }
        else if (player==2 && i==2){
            hit2=true;
            _p2c4 = Random().nextInt(52) + 1;
            j=_p2c4;
          }
        else if (player==2 && i==3){
            hit2=true;
            _p2c5 = Random().nextInt(52) + 1;
            j=_p2c5;
          }
        else if (player==2 && i==4){
            hit2=true;
            _p2c6 = Random().nextInt(52) + 1;
            j=_p2c6;
          }
      });
      return Image.asset('assets/card$j');
}
Stand(){}


Widget _start()
{
  return FlatButton(
    color: Colors.black,
    onPressed: ()
    {
      setState(()
      {
        if (player == 1) {
            _p1c1 = Random().nextInt(52) + 1;
            _p1c2 = Random().nextInt(52) + 1;
          } else if (player==2){
            _p2c1 = Random().nextInt(52) + 1;
            _p2c2 = Random().nextInt(52) + 1;
          }
      });
    },
    child: Text('START'),
  );
}

Widget _card1( var cardnumber1, var cardnumber2)
{
  return  Row(
      children: <Widget>[
        Image.asset('assets/card$cardnumber1'),
        SizedBox( width: 2,),
        Image.asset('assets/card$cardnumber2',),
        SizedBox( width: 2,),
      ],
  );
}

Widget _card2( var cardnumber1, var cardnumber2)
{
  return Row(
      children: <Widget>[
        Image.asset('assets/card$cardnumber1'),
        SizedBox( width: 2,),
        Image.asset('assets/card$cardnumber2',),
        SizedBox( width: 2,),
      ],
  );
}




}