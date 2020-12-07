import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class SliderCurrentCustomFuture extends StatefulWidget {
  SliderCurrentCustomFuture({Key key}) : super(key: key);

  @override
  _SliderCurrentCustomFutureState createState() =>
      _SliderCurrentCustomFutureState();
}

class _SliderCurrentCustomFutureState extends State<SliderCurrentCustomFuture> {
  dartUI.Image customImage;
  double sliderValue = 0.0;/// INITIAL VALUE

  Future<dartUI.Image> loadImage(String pathOfAsset) async {
    ByteData data = await rootBundle.load(pathOfAsset);
    dartUI.Codec codec = await dartUI.instantiateImageCodec(
        data.buffer.asUint8List()
    );
    dartUI.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    // v
    loadImage('lib/assets/info_48.png').then((image) {
      customImage = image;
    });

    super.initState();
  }

  /// FOR THUMB IMAGE CHANGE
  // bool atFour;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 40),
                  width: MediaQuery.of(context).size.width * 1,
                  child: SliderTheme(
                    data: SliderThemeData(
                      /// WARNA AKTIF
                      // activeTrackColor: Colors.yellowAccent,
                      activeTrackColor: null,
                      // inactiveTrackColor: Colors.cyan[100],
                      inactiveTrackColor: null,
                      // activeTickMarkColor: sliderValue <= 4.0 ? Colors.amber : Colors.brown,
                      // inactiveTickMarkColor: Colors.brown,
                      /// GA PAKE OVERLAY
                      // overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
                      // rangeThumbShape: RoundRangeSliderThumbShape(
                      //   elevation: 40,
                      //   disabledThumbRadius: 5,
                      //   enabledThumbRadius: 10,
                      //   pressedElevation: 10
                      // ),
                      thumbShape: sliderValue <= 4.0 ?
                      SliderThumbImage(customImage) :
                      RoundSliderThumbShape(enabledThumbRadius: 20),
                      trackHeight: 10,
                      trackShape: RoundedRectSliderTrackShape(),
                      tickMarkShape: RoundSliderTickMarkShape(
                          tickMarkRadius: 10
                      ),
                      /// WARNA LABEL (CALLOUT)
                      // valueIndicatorColor: Colors.red,
                    ),
                    child: Slider(
                      divisions: 5,
                      label: sliderValue.toString(),
                      max: 10.0,
                      min: 0.0,
                      value: sliderValue,
                      onChanged: (value) {/// REQUIRED
                        setState(() {/// ng
                          sliderValue = value;
                          if (value >= 4.0) {
                            loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                              customImage = image;
                            });
                          }

                          /// PERLUKAH SET IMAGE DI ONCHANGE?
                          /// KARENA ONCHANGED YAITU KONDISI SAAT DRAGGING
                        });
                      },

                      /// This callback also shouldn't be used to update the slider
                      /// value (use onChanged for that)
                      onChangeStart: (value) {
                        setState(() {
                          if (value >= 4.0) {
                            loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                              customImage = image;
                            });
                          } else {
                            loadImage('lib/assets/info_48.png').then((image) {
                              customImage = image;
                            });
                          }
                        });
                      },

                      /// This callback shouldn't be used to update the slider
                      /// value (use onChanged for that), but rather to know
                      /// when the user has completed selecting a new value
                      /// by ending a drag or a click.
                      onChangeEnd: (newValue) {
                        setState(() {
                          if (newValue >= 4.0) {
                            loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                              customImage = image;
                            });
                            Future.delayed(
                                Duration(seconds: 4),
                                    (){
                                  Toast.show(
                                      '4 seconds, sliderValue > 4 => $sliderValue',
                                      context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.BOTTOM
                                  );
                                  setState(() {
                                    sliderValue = 2.0;
                                  });
                                });

                            // start();
                          } else {
                            if (_timer != null) {
                              _timer.cancel();
                              _timer = null;
                              loadImage('lib/assets/info_48.png').then((image) {
                                customImage = image;
                              });
                            }
                          }
                        });
                      },
                    ),
                  ),
                )
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  sliderValue.toInt().toString(),
                  style: TextStyle(
                      fontSize: 48
                  ),
                ),
              ]
          )
        ]
    );
  }

  ///
  /// TIMER
  Timer _timer;
  int _start = 3;
  // int _start = 2;

  void startWithNullCheck(){
    if (_timer != null) {
      _timer.cancel();
      _timer = null;

      sliderValue = 2.0;
      loadImage('lib/assets/info_48.png').then((image) {
        customImage = image;
      });
    } else {
      _timer = new Timer.periodic(const Duration(seconds: 1),
              (Timer timer) {/// berapapun start, tetap pake 1
            setState(() {
              if (_start < 1) {/// tetap pake 1
                _timer.cancel();

                /// SET THUMB VALUE TO FOR EXAMPLE 1.0
                sliderValue = 2.0;
                /// THEN ALSO SET IMAGE BACK TO NOT BONUS ONE
                loadImage('lib/assets/info_48.png').then((image) {
                  customImage = image;
                });
              } else {
                _start = _start - 1;/// tetap pake 1
              }
            });
          });
    }
  }

  void start(){/// v
    // const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        const Duration(seconds: 1),/// berapapun start, tetap pake 1
            (Timer timer) {
          setState(() {
            if (_start < 1) {/// tetap pake 1
              _timer.cancel();

              /// SET THUMB VALUE TO FOR EXAMPLE 1.0
              sliderValue = 2.0;
              /// THEN ALSO SET IMAGE BACK TO NOT BONUS ONE
              loadImage('lib/assets/info_48.png').then((image) {
                customImage = image;
              });
            } else {
              _start = _start - 1;/// tetap pake 1
            }
          });
        });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;/// NG
    }
    // _timer.cancel();
    super.dispose();
  }

  ///
  /// BY USING COUNTDOWN TIMER
  countDownTimer() async {
    int timerCount;
    for (int x = 5; x > 0; x--) {
      await Future.delayed(Duration(seconds: 1)).then((_) {
        setState(() {
          timerCount -= 1;
          Toast.show(
              "countDownTimer",
              context,
              duration: Toast.LENGTH_SHORT,
              gravity:  Toast.BOTTOM
          );
        });
      });
    }
  }
}

class SliderThumbImage extends SliderComponentShape {
  final dartUI.Image image;

  SliderThumbImage(this.image);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(0, 0);
  }

  @override
  void paint(PaintingContext context, Offset center, {Animation<double> activationAnimation, Animation<double> enableAnimation, bool isDiscrete, TextPainter labelPainter, RenderBox parentBox, SliderThemeData sliderTheme, TextDirection textDirection, double value, double textScaleFactor, Size sizeWithOverflow}) {
    final canvas = context.canvas;
    final imageWidth = image?.width ?? 10;
    final imageHeight = image?.height ?? 10;

    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      center.dy - (imageHeight / 2),
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    if (image != null) {
      canvas.drawImage(image, imageOffset, paint);
    }
  }
}