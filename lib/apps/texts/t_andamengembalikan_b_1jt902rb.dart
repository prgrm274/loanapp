import 'package:flutter/material.dart';

class TAndaMengembalikanB1jt902rb extends StatefulWidget {
  TAndaMengembalikanB1jt902rb({Key key}) : super(key: key);

  @override
  _TAndaMengembalikanB1jt902rbState createState() =>
      _TAndaMengembalikanB1jt902rbState();
}

class _TAndaMengembalikanB1jt902rbState extends State<TAndaMengembalikanB1jt902rb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,

      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        'Rp. 1.902.000',
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }
}