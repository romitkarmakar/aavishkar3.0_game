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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "CASINO",
              style: TextStyle(
                  color: Colors.orange[400],
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.attach_money,
                  color: Colors.green[900],
                  //Color(0xFF4ef037),
                  size: 34,
                ),
                Text(
                  "TOKENS",
                  style: TextStyle(color: Colors.green[900]),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            right: 7,
            child: RaisedButton(
              shape: StadiumBorder(),
              padding: EdgeInsets.all(5),
              color: Colors.orange[400],
              splashColor: Colors.orangeAccent[700],
              onPressed: () {
                Navigator.pushNamed(context, "/store");
              },
              child: Row(
                children: <Widget>[
                  Text("STORE"),
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/dicegame');
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarColor: Color(0xFF6ED2CA),
                          systemNavigationBarIconBrightness: Brightness.dark));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        0, 0, MediaQuery.of(context).size.width / 2, 0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20.0,
                            spreadRadius: 10.0)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/fdice.jpg"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/21game');
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                          statusBarColor: Color(0xFFF2837A),
                          systemNavigationBarIconBrightness: Brightness.dark));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width / 2, 0, 0, 0),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20.0,
                            spreadRadius: 10.0)
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/fcards.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
