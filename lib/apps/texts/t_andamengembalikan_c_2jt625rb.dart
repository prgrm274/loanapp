import 'package:flutter/material.dart';

class TAndaMengembalikanC2jt625rb extends StatefulWidget {
  TAndaMengembalikanC2jt625rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanC2jt625rbState createState() =>
      _TAndaMengembalikanC2jt625rbState();
}

class _TAndaMengembalikanC2jt625rbState extends State<TAndaMengembalikanC2jt625rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 2.625.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}