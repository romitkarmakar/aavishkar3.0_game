import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height / 4,
          //   child: Image(
          //     image: AssetImage("assets/gambling.png"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    SystemChrome.setEnabledSystemUIOverlays([]);
                    Navigator.pushNamed(context, '/dicegame');
                  });
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/fdice.jpg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    SystemChrome.setEnabledSystemUIOverlays([]);
                    Navigator.pushNamed(context, '/21game');
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width / 2 - 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/fcards.png"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height / 4,
          //   child: Image(
          //     image: AssetImage("assets/gambling.png"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ],
      ),
    );
  }
}
