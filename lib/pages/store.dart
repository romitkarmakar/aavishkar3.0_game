import 'package:flutter/material.dart';

class TokenStore extends StatefulWidget {
  @override
  _TokenStoreState createState() => _TokenStoreState();
}

class _TokenStoreState extends State<TokenStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("STORE"),
      ),
    );
  }
}
