import 'package:flutter/material.dart';

class Text2625 extends StatefulWidget {
  Text2625({Key key}) : super(key: key);

  @override
  _Text2625State createState() => _Text2625State();
}

class _Text2625State extends State<Text2625> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Rp 2.625.000',
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}