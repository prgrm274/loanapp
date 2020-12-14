import 'package:flutter/material.dart';

class TCicilanA175rb extends StatefulWidget {
  TCicilanA175rb({Key key}) : super(key: key);

  @override
  _TCicilanA175rbState createState() =>
      _TCicilanA175rbState();
}

class _TCicilanA175rbState extends State<TCicilanA175rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 175.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}