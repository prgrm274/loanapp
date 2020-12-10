import 'package:flutter/material.dart';

class Text525 extends StatefulWidget {
  Text525({Key key}) : super(key: key);

  @override
  _Text525State createState() => _Text525State();
}

class _Text525State extends State<Text525> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp. 525.000',
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}