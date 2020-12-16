import 'package:flutter/material.dart';

class TAndaMengembalikanC2jt400rb extends StatefulWidget {
  TAndaMengembalikanC2jt400rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanC2jt400rbState createState() =>
      _TAndaMengembalikanC2jt400rbState();
}

class _TAndaMengembalikanC2jt400rbState extends State<TAndaMengembalikanC2jt400rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 2.400.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}