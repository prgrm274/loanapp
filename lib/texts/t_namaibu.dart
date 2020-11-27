import 'package:flutter/material.dart';

class TNamaibu extends StatefulWidget {
  TNamaibu({Key key}) : super(key: key);

  @override
  _TNamaibuState createState() => _TNamaibuState();
}

class _TNamaibuState extends State<TNamaibu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Text(
        'Nama ibu kandung',
        style: TextStyle(color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'
        ),
      ),
    );
  }
}