import 'package:flutter/material.dart';

class TAndaMengembalikanC2jt850rb extends StatefulWidget {
  TAndaMengembalikanC2jt850rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanC2jt850rbState createState() =>
      _TAndaMengembalikanC2jt850rbState();
}

class _TAndaMengembalikanC2jt850rbState extends State<TAndaMengembalikanC2jt850rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 2.850.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}