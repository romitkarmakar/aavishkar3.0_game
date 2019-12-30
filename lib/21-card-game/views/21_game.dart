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
  var _p1c1=1;
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
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(5.0),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _chips(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _button(Colors.green, 'HIT', true,2),
                              SizedBox(
                                width: 10,
                              ),
                              _button(Colors.red, 'STAND', false,2)
                            ],
                          ),
                          Expanded(child:Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)),
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(2.0),
                            child: _card(_p2c1,_p2c2)
                          ),),
                          _start(),
                          Expanded( child:Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20.0)),
                            margin: EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(2.0),
                            child:_card(_p1c1, _p1c2),
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _button(Colors.green, 'HIT', true,1),
                              SizedBox(
                                width: 10,
                              ),
                              _button(Colors.red, 'STAND', false,1),
                            ],
                          ),
                          _chips()
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
  return Expanded(child:RaisedButton(
    color: color,
    child: Text(
      '$label',
    ),
    onPressed: (){
      setState((){
      Hit(1);
      });
    },
  )
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
      return Expanded(child:Image.asset('assets/card$j.png'));
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
            _p1c2 = Random().nextInt(52) + 1;
            _p1c1 = Random().nextInt(52) + 1;
            
            _p2c1 = Random().nextInt(52) + 1;
            _p2c2 = Random().nextInt(52) + 1;
          
      });
    },
    child: Text('START'),
  );
}

Widget _card( var cardnumber1, var cardnumber2)
{
  return  Center(
            widthFactor: MediaQuery.of(context).size.width,
            child:Stack(
              children: <Widget>[
                Positioned(
                  left:0,
                  bottom: 2,
                  top: 2,
                  child:Image.asset('assets/card$cardnumber1.png'),
                ),
                Positioned(
                  left: 50,
                  bottom: 2,
                  top: 2,
                  child:Image.asset('assets/card$cardnumber2.png'),
                ),
              ],
              overflow: Overflow.clip,
            )
         );
}

Widget _chips()
{
  return Container(

                            width: MediaQuery.of(context).size.width,
  child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Expanded(child:FlatButton(
        onPressed: (){},
        color: Colors.orange,
        child: Text('50'),
      ),),
      SizedBox(width: 10,),
      Expanded(child:FlatButton(
        onPressed: (){},
        color: Colors.amberAccent,
        child: Text('100'),
      ),),
      SizedBox(width: 10,),
      Expanded(child:FlatButton(
        onPressed: (){},
        color: Colors.cyan,
        child: Text('500'),
      ),),
      SizedBox(width: 10,),
      Expanded(child:FlatButton(
        onPressed: (){},
        color: Colors.pinkAccent,
        child: Text('1000'),
      ),),
    ],
  )
  );
}




}