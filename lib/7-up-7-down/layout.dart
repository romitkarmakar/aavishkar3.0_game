import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:math';
import 'package:flutter/services.dart';

class UpDownGame extends StatefulWidget {
  @override
  _UpDownGameState createState() => _UpDownGameState();
}


class _UpDownGameState extends State<UpDownGame> {
  var coins_left=50;
  var choice;
  var dice1;
  var dice2;
  bool up7;
  bool down7;

  @override
  void setState(fn) {
    // TODO: implement setState
    coins_left=100;
    choice=1;
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
          if (choice ==0 && up7==true) 
          {
            dice1 = Random().nextInt(6) + 1;
            dice2 = Random().nextInt(6) + 1;
            up7=false;
            down7=false;
          } 
          else if (choice ==0 && down7==true) 
          {
            dice1 = Random().nextInt(6) + 1;
            dice2 = Random().nextInt(6) + 1;
            up7=false;
            down7=false;
          } 
          else if(choice==-1 && up7==true)
          {
            dice1 = Random().nextInt(3) + 1;
            dice2 = Random().nextInt(3) + 1;
            up7=false;
            down7=false;
          }
          else if(choice==-1 && down7==true)
          {
            dice1 = Random().nextInt(3) + 4;
            dice2 = Random().nextInt(3) + 4;
            up7=false;
            down7=false;
          }
          else if(choice==1 && down7==true)
          {
            dice1 = Random().nextInt(3) + 1;
            dice2 = Random().nextInt(3) + 1;
            up7=false;
            down7=false;
            
          }
          else if(choice==1 && up7==true)
          {
            dice1 = Random().nextInt(3) + 4;
            dice2 = Random().nextInt(3) + 4;
            up7=false;
            down7=false;
            
          }
        });
    },
    child: Text('START'),
  );
}

 
//   Widget _Up(var label,bool state)
//   {
//     return CircleAvatar(
//       radius: 80,
//       backgroundColor: Colors.lightGreen[300],
//       child: InkWell(
//         onTap: (){
//           setState(()
//         {
//           up7=true;
//           down7=false;
//         });
//         },
//         splashColor: Colors.green,
//         focusColor: Colors.green[100],
//         child: Text('$label',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//       ),),
//       )
//     );
//   }

// Widget _Down(var label,bool state)
//   {
//     return CircleAvatar(
//       radius: 80,
//       backgroundColor: Colors.lightGreen[300],
//       child: InkWell(
//         onTap: (){
//           setState(()
//         {
//           down7=true;
//           up7=false;
//         });
//         },
//         splashColor: Colors.green,
//         focusColor: Colors.green[100],
//         child: Text('$label',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20
//       ),),
//       )
//     );
//   }


  // Widget _Up(var label,bool state)
  // {
  //   return RaisedButton(
  //     color: Colors.green[100],
  //     onPressed: ()
  //     {
  //       setState(()
  //       {
  //         up7=true;
  //         down7=false;
  //       });
  //     },
  //     child: Text('$label'),
  //   );
  // }
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
// Widget _Down(var label,bool state)
//   {
//     return FlatButton(
//       onPressed: ()
//       {
//         setState(()
//         {
//           down7=true;
//           up7=false;
//         });
//       },
//       child: Text('$label'),
//     );
//   }

  Widget _chipsLay()
{
  return Container(
  width: MediaQuery.of(context).size.width,
  child:Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(width: 10,),
      _chips(5,'assets/sky.png'),
      SizedBox(width: 10,),
      _chips(10,'assets/violet.png'),
      SizedBox(width: 10,),
      _chips(20,'assets/blue.png'),
      SizedBox(width: 10,),
    ],
  )
  );
}

Widget _chips( var chip_value,String chip_image)
{
  return Expanded(child:Container(
    child: FlatButton(
      onPressed: (){},
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


}