import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressIndicator1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      new Text(
        '20% terisi\n',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      new LinearProgressIndicator(
        backgroundColor: Colors.red[200],
        valueColor: new AlwaysStoppedAnimation<Color>(
          Colors.orangeAccent,
        ),
        value: 100,
      ),
    ],
    crossAxisAlignment: CrossAxisAlignment.start,);
    /*return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.red[200],
        value: 100,
      ),
    );*/
  }
}