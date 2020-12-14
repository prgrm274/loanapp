import 'package:flutter/material.dart';

class TCicilanB350rb extends StatefulWidget {
  TCicilanB350rb({Key key}) : super(key: key);

  @override
  _TCicilanB350rbState createState() =>
      _TCicilanB350rbState();
}

class _TCicilanB350rbState extends State<TCicilanB350rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 350.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}