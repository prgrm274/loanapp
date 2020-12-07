import 'package:flutter/material.dart';

class TAndaMengembalikanA800rb extends StatefulWidget {
  TAndaMengembalikanA800rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanA800rbState createState() =>
      _TAndaMengembalikanA800rbState();
}

class _TAndaMengembalikanA800rbState extends State<TAndaMengembalikanA800rb> {
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