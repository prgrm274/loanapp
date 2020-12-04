import 'package:flutter/material.dart';
import 'package:voidrealm/sliders/slider_widget_round_thumb.dart';
import '../slider_current_custom_thumb_circle.dart';

class SliderWidget2 extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;

  SliderWidget2(
      {this.sliderHeight = 48,
        this.max = 10,
        this.min = 0,
        this.fullWidth = false});

  @override
  _SliderWidget2State createState() => _SliderWidget2State();
}

class _SliderWidget2State extends State<SliderWidget2> {
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return Container(
      width: this.widget.fullWidth
          ? double.infinity
          : (this.widget.sliderHeight) * 5.5,
      height: (this.widget.sliderHeight),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
          Radius.circular((this.widget.sliderHeight * .3)),
        ),
        gradient: new LinearGradient(
            colors: [
              const Color(0xFF00c6ff),
              const Color(0xFF0072ff),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            this.widget.sliderHeight * paddingFactor,
            2,
            this.widget.sliderHeight * paddingFactor, 2
        ),
        child: Row(
          children: <Widget>[
            Text(
              '${this.widget.min}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,

              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Expanded(
              child: Center(
                child: SliderTheme(
                  /*data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(.5),

                    trackHeight: 4.0,

                    /// USE slider3
                    *//*thumbShape: CustomSliderThumbCircle(
                      thumbRadius: this.widget.sliderHeight * .4,
                      min: this.widget.min,
                      max: this.widget.max,
                    ),*//*

                    /// USE slider2
                    thumbShape: JRoundSliderThumbShape(
                      disabledThumbRadius: 4,
                      enabledThumbRadius: 20,
                    ),

                    overlayColor: Colors.white.withOpacity(.4),
                    //valueIndicatorColor: Colors.white,
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),*/
                  data: SliderThemeData(
                    thumbColor: Colors.red,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                  ),
                  child: Material(
                    child: Slider(
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        }),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: this.widget.sliderHeight * .1,
            ),
            Text(
              '${this.widget.max}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: this.widget.sliderHeight * .3,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}