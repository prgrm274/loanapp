import 'package:flutter/material.dart';

class TAndaMengembalikanD3jt500rb extends StatefulWidget {
  TAndaMengembalikanD3jt500rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanD3jt500rbState createState() =>
      _TAndaMengembalikanD3jt500rbState();
}

class _TAndaMengembalikanD3jt500rbState extends State<TAndaMengembalikanD3jt500rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 3.500.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}