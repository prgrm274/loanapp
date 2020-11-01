import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Image(
              image: AssetImage('lib/assets/ojk.png'),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 110,
              height: 100,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image(height: 75, width: 150,
              image: AssetImage('lib/assets/dfix.png'),
            ),
          ),
        ]
      ),
    );
  }
}