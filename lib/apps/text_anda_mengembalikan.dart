import 'package:flutter/material.dart';

class TextAndaMengembalikan extends StatefulWidget {
  TextAndaMengembalikan({Key key}) : super(key: key);

  @override
  _TextAndaMengembalikanState createState() => _TextAndaMengembalikanState();
}

class _TextAndaMengembalikanState extends State<TextAndaMengembalikan> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Anda mengembalikan',
      style: TextStyle(
          color: Colors.blue[900],
          fontSize: 13,
          fontFamily: 'Sans'
      ),
    );
  }
}