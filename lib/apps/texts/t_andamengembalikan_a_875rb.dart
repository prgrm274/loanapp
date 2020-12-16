import 'package:flutter/material.dart';

class TAndaMengembalikanA875rb extends StatefulWidget {
  TAndaMengembalikanA875rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanA875rbState createState() =>
      _TAndaMengembalikanA875rbState();
}

class _TAndaMengembalikanA875rbState extends State<TAndaMengembalikanA875rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 875.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}