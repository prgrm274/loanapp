import 'package:flutter/material.dart';

class TAndaMengembalikanB1jt600rb extends StatefulWidget {
  TAndaMengembalikanB1jt600rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanB1jt600rbState createState() =>
      _TAndaMengembalikanB1jt600rbState();
}

class _TAndaMengembalikanB1jt600rbState extends State<TAndaMengembalikanB1jt600rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 800.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}