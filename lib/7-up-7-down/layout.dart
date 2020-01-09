import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/services.dart';

class UpDownGame extends StatefulWidget {
  @override
  _UpDownGameState createState() => _UpDownGameState();
}

//all the logic codes are written in _start()

class _UpDownGameState extends State<UpDownGame> {
  var coins_left;

  var choice;      //if 1 then win if -1 then loose if 0 then neutral

  var dice1;        //value of dice1
  var dice2;        //value of dice2
  
  var total;        //total value of dice1+dice2
  
  var result;        //either "winner" or "loser"
  
  var coin_value;     //value of coin, set when the user hit the respective chip_button

  bool up7=false;
  bool down7=false;
  
  bool five=false;
  bool ten=false;
  bool twenty=false;
  
  bool picked;  //whether betting coin is selected or not

  @override
  void setState(fn) {
    // TODO: implement setState
    coins_left=100;
    choice=0;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.black,
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
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0)
                        ),
                    margin: EdgeInsets.all(4.0),
                    padding: EdgeInsets.all(4.0),
                    child: Column(
                      children: <Widget>[
                        _coinsLeft(coins_left),
                        SizedBox(height: 20,),
                        _diceDisplay(),
                        SizedBox(height: 50,),
                        Container(height:50,
                          width: MediaQuery.of(context).size.width,
                          child:_start()),
                        SizedBox(height: 50,),
                        Expanded(child:Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(child: _upButton(),),
                              SizedBox(width: 10,),
                              Expanded(child:_downButton(),),
                            ],
                          ),
                        ),),
                        SizedBox(height:10),
                        Expanded(child:_chipsLay())
                      ],
                    ),
                  ),
                ]
              )
            )
          )
        )
      )
    );
           
  }



  Widget _coinsLeft(var coins_left)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20.0)
      ),
      margin: EdgeInsets.only(left: 230),
      child: Row(
        children: <Widget>[
          SizedBox(width: 5.0,),
          Expanded(child:Container(
            child:Text('$coins_left',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40
          ),),),),
          SizedBox(width: 5.0,),
          Expanded(child:Image.asset('assets/coined.png'),),
          SizedBox(width: 5.0,),
        ],
      ),
    );
  }

  Widget _start()
{
  return FlatButton(
    color: Colors.blueGrey,
    onPressed: (){
      setState(() {
          if(five==true|| ten==true ||twenty==true)
          {
            picked=true;
          }


          if(up7==false && down7==false)
          {
            _alert7();
          }


          if(five==false && ten==false && twenty==false)
          {
            _alertChip();
          }


          if (choice ==0 && up7==true && picked==true) 
          {
            dice1 = Random().nextInt(6) + 1;
            dice2 = Random().nextInt(6) + 1;
            
            total=dice1+dice2;
            
            up7=false;
            down7=false;
            
            picked=false;
            
            ten=false;
            five=false;
            twenty=false;
            
            if(total>=7)
            {
              result="winner";
            }
            else
            {
              result="loser";
            }
            
          } 

          else if (choice ==0 && down7==true && picked==true) 
          {
            dice1 = Random().nextInt(6) + 1;
            dice2 = Random().nextInt(6) + 1;
            
            total=dice1+dice2;
            
            up7=false;
            down7=false;
            
            picked=false;
            
            ten=false;
            five=false;
            twenty=false;
            
            if(total<=7)
            {
              result="winner";
            }
            else
            {
              result="loser";
            }
          } 

          else if(choice==-1 && up7==true && picked==true)
          {
            dice1 = Random().nextInt(3) + 1;
            dice2 = Random().nextInt(3) + 1;
            
            total=dice1+dice2;
            
            up7=false;
            down7=false;
            
            picked=false;
            
            ten=false;
            five=false;
            twenty=false;
            
            result="loser";
          }

          else if(choice==-1 && down7==true && picked==true)
          {
            dice1 = Random().nextInt(3) + 4;
            dice2 = Random().nextInt(3) + 4;
            
            total=dice1+dice2;
            
            up7=false;
            down7=false;
            
            picked=false;
            
            ten=false;
            five=false;
            twenty=false;

            result="loser";
          }

          else if(choice==1 && down7==true && picked==true)
          {
            dice1 = Random().nextInt(3) + 1;
            dice2 = Random().nextInt(3) + 1;

            total=dice1+dice2;
            
            up7=false;
            down7=false;
            
            picked=false;
            
            ten=false;
            five=false;
            twenty=false;
            
            result="winner";
          }

          else if(choice==1 && up7==true && picked==true)
          {
            dice1 = Random().nextInt(3) + 4;
            dice2 = Random().nextInt(3) + 4;

            total=dice1+dice2;

            up7=false;
            down7=false;

            picked=false;

            ten=false;
            five=false;
            twenty=false;
            
            result="winner";
          }
          
        });
    },
    child: Text('START',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.blueGrey[100]
    ),),
  );
}

Widget _downButton()
{
  return
      FlatButton(
      onPressed: ()
      {
        setState(()
        {
          down7=true;
          up7=false;
        });
      },
      child: Image(image: AssetImage('assets/7down.png'),),
    );
}
Widget _upButton()
{
  return
      FlatButton(
      onPressed: ()
      {
        setState(()
        {
          up7=true;
          down7=false;
        });
      },
      child: Image(image: AssetImage('assets/7up.png'),),
    );
}

  Widget _chipsLay()
{
  return Container(
  width: MediaQuery.of(context).size.width,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 10,),
      _chips5(5,'assets/sky.png'),
      SizedBox(width: 10,),
      _chips10(10,'assets/violet.png'),
      SizedBox(width: 10,),
      _chips20(20,'assets/blue.png'),
      SizedBox(width: 10,),
    ],
  )
  );
}

Widget _chips5( var chip_value,String chip_image)
{
  return Expanded(child:Container(
    child: FlatButton(
      onPressed: (){
        setState((){
          five=true;
          ten=false;
          twenty=false;

          coin_value=5;

        });
      },
      child:Image.asset('$chip_image')
    ),
  ));
}

Widget _chips10( var chip_value,String chip_image)
{
  return Expanded(child:Container(
    child: FlatButton(
      onPressed: (){
        setState((){
          five=false;
          ten=true;;
          twenty=false;
          
          coin_value=10;

        });
      },
      child:Image.asset('$chip_image')
    ),
  ));
}

Widget _chips20( var chip_value,String chip_image)
{
  return Expanded(child:Container(
    child: FlatButton(
      onPressed: (){
        setState((){
          five=false;
          ten=false;
          twenty=true;
          
          coin_value=20;
        
        });
      },
      child:Image.asset('$chip_image')
    ),
  ));
}

Widget _diceDisplay()
{
  return Expanded(child:Container(
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 30,),
                              Expanded(
                                child: Image.asset('assets/$dice1.png'),
                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child: Image.asset('assets/$dice2.png'),
                              ),
                              SizedBox(width: 30,),
                            ],
                          ),
                        ),);
}

Future<void> _alert7() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Oops!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Choose between 7 UP and & DOWN!'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Continue'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _alertChip() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Oops!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Choose the value you want to bet on!'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Continue'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



}