import 'package:flutter/material.dart';

class JDropdownButton extends StatefulWidget {
  JDropdownButton({Key key}) : super(key: key);

  @override
  _JDropdownButtonState createState() => _JDropdownButtonState();
}

class _JDropdownButtonState extends State<JDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: DropdownButton<String>(
          items: <String>['A', 'JDropdownButton', 'C', 'D'].map((String nilai) {
            return new DropdownMenuItem<String>(
              value: nilai,
              child: new Text(nilai),
            );
          }).toList(),

          onChanged: (_) {},


        ),
      )
    );
  }
}