import 'package:flutter/material.dart';

class TAndaMengembalikanB1jt750rb extends StatefulWidget {
  TAndaMengembalikanB1jt750rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanB1jt750rbState createState() =>
      _TAndaMengembalikanB1jt750rbState();
}

class _TAndaMengembalikanB1jt750rbState extends State<TAndaMengembalikanB1jt750rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 1.750.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}