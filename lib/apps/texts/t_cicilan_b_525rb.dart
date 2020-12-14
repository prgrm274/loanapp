import 'package:flutter/material.dart';

class TCicilanC525rb extends StatefulWidget {
  TCicilanC525rb({Key key}) : super(key: key);

  @override
  _TCicilanC525rbState createState() =>
      _TCicilanC525rbState();
}

class _TCicilanC525rbState extends State<TCicilanC525rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 525.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}