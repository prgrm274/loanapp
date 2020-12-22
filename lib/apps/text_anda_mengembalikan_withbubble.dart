import 'package:flutter/material.dart';

class TextAndaMengembalikanBubble extends StatefulWidget {
  TextAndaMengembalikanBubble({Key key}) : super(key: key);

  @override
  _TextAndaMengembalikanBubbleState createState() => _TextAndaMengembalikanBubbleState();
}

class _TextAndaMengembalikanBubbleState extends State<TextAndaMengembalikanBubble> {
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