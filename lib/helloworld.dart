import 'package:flutter/material.dart';

//22
class hello extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(5),
      child: new Column(
        children: <Widget>[
          new Text('array text 0'),
          new Text('array text 1'),
          new Text('array text 2'),
        ],
      ),
    );
  }
}