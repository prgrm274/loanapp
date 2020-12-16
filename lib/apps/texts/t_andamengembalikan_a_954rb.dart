import 'package:flutter/material.dart';

class TAndaMengembalikanA954rb extends StatefulWidget {
  TAndaMengembalikanA954rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanA954rbState createState() =>
      _TAndaMengembalikanA954rbState();
}

class _TAndaMengembalikanA954rbState extends State<TAndaMengembalikanA954rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 954.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}