import 'package:flutter/material.dart';

class Slider1 extends StatefulWidget {
  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {

  double _value = 0.0;

  void _onChange(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,

      appBar: new AppBar(
        title: new Text('Slider'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32),

        child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.lightBlueAccent,
            ///RoundedRectSliderTrackShape
            ///RectangularSliderTrackShape
            trackShape: RectangularSliderTrackShape(),
            trackHeight: 4.0,
            thumbColor: Colors.white,
            thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 20.0),
            overlayColor: Colors.white.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(
                overlayRadius: 40.0),
          ),
          child: Slider(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}