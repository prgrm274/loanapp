import 'package:flutter/material.dart';

class TCicilanD700rb extends StatefulWidget {
  TCicilanD700rb({Key key}) : super(key: key);

  @override
  _TCicilanD700rbState createState() =>
      _TCicilanD700rbState();
}

class _TCicilanD700rbState extends State<TCicilanD700rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 700.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}