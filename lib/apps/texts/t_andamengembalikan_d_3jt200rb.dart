import 'package:flutter/material.dart';

class TAndaMengembalikanD3jt200rb extends StatefulWidget {
  TAndaMengembalikanD3jt200rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanD3jt200rbState createState() =>
      _TAndaMengembalikanD3jt200rbState();
}

class _TAndaMengembalikanD3jt200rbState extends State<TAndaMengembalikanD3jt200rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 3.200.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}