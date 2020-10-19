import 'package:flutter/material.dart';
import 'package:flutter_numpad_widget/flutter_numpad_widget.dart';

class Numpad1 extends StatelessWidget {

  final _controller = NumpadController(
    format: NumpadFormat.PHONE);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: NumpadText(
              errorColor: Colors.redAccent,
              controller: _controller,
              style: TextStyle(fontSize: 40),
            ),
          ),
          Expanded(
            child: Numpad(
              buttonColor: Colors.blue,
              controller: _controller,
              buttonTextSize: 40,///40
            ),
          )
        ]
      ),
    );

  }
}