import 'package:flutter/material.dart';

class LpiVr extends StatefulWidget {
  LpiVr({Key key}) : super(key: key);

  @override
  _LpiVrState createState() => _LpiVrState();
}

class _LpiVrState extends State<LpiVr> {
  double _value = 0.0;

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Flexible(
        child: Column(
            children: <Widget>[
              Text('Value is ${_value.round()}'),
              Slider(
                min: 0,
                max: 100,
                value: _value,
                onChanged: (double value) {
                  _onChanged(value);
                },
              ),
              LinearProgressIndicator(
                value: _value * .01,
              )
            ]
        ),
      ),
    );
  }
}