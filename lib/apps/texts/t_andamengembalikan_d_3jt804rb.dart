import 'package:flutter/material.dart';

class TAndaMengembalikanD3jt804rb extends StatefulWidget {
  TAndaMengembalikanD3jt804rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanD3jt804rbState createState() =>
      _TAndaMengembalikanD3jt804rbState();
}

class _TAndaMengembalikanD3jt804rbState extends State<TAndaMengembalikanD3jt804rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 3.804.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}