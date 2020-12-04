import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/sliders/slider_current_custom_thumb_circle.dart';

class SliderCurrent extends StatefulWidget {
  SliderCurrent({Key key}) : super(key: key);

  @override
  _SliderCurrentState createState() =>
      _SliderCurrentState();
}

class _SliderCurrentState extends State<SliderCurrent> {
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

  /// initState() lifecycle method since it is only called once
  /// when the widget is inserted into the widget tree
  /// (i.e. when the widget is initialized)
  @override
  void initState() {
    /// v
    /// INITIALISED ONCE JADI SET THUMB LANGSUNG KE THUMB ANGKA
    loadImage('lib/assets/info_48.png').then((image) {
      customImage = image;
    });


    super.initState();
  }

  /// FOR THUMB IMAGE CHANGE
  static bool moreThan4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Row(
              children: <Widget>[
                Container(/// GA PAKE MARGIN SOALNYA TANPA SCAFFOLD
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  width: MediaQuery.of(context).size.width * 1,
                  child: SliderTheme(
                    data: SliderThemeData(
                      /// WARNA AKTIF
                      activeTrackColor: null,
                      inactiveTrackColor: null,
                      thumbShape: sliderValue > 4.0 ?
                      SliderCurrentCustomThumb(customImage) :
                      SliderCurrentCustomCircle(thumbRadius: 20),
                      /// DEFAULT THUMB SHAPE
                      // RoundSliderThumbShape(enabledThumbRadius: 20),
                      trackHeight: sliderValue > 4.0 ? 8 : 2,
                      trackShape: RoundedRectSliderTrackShape(),
                      tickMarkShape: RoundSliderTickMarkShape(
                          tickMarkRadius: 10
                      ),
                      /// WARNA LABEL (CALLOUT)
                      // valueIndicatorColor: Colors.red,
                    ),
                    child: Slider(
                      divisions: 5,
                      /// LABEL / CALLOUT DI ATAS THUMB
                      label: sliderValue.toString(),
                      max: 10.0,
                      min: 0.0,
                      // value: moreThan4 ? 2.0 : sliderValue,
                      value: sliderValue,
                      onChanged: (value) {/// REQUIRED
                        setState(() {/// ng
                          sliderValue = value;
                          if (sliderValue > 4.0) {
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
                          /// SEBELUMNYA DI SINI
                        });
                        // if (value > 4.0) {
                        //   loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                        //     customImage = image;
                        //   });
                        // } else {
                        //   loadImage('lib/assets/info_48.png').then((image) {
                        //     customImage = image;
                        //   });
                        // }
                        // setState(() {
                        //   /// SEBELUMNYA DI SINI
                        // });
                      },

                      /// This callback shouldn't be used to update the slider
                      /// value (use onChanged for that), but rather to know
                      /// when the user has completed selecting a new value
                      /// by ending a drag or a click.
                      ///
                      /// JADI GA PAKE SETSTATE DISINI
                      onChangeEnd: (newValue) {
                        setState(() {
                          /// SEBELUMNYA DI SINI
                          if (newValue > 4.0) {
                            loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                              customImage = image;
                            });

                            /// USING FUTURE
                            Future.delayed(
                                Duration(seconds: 4),
                                    (){
                                  Toast.show(
                                      '4 seconds, sliderValue > 4 => $sliderValue',
                                      context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity:  Toast.BOTTOM
                                  );
                                }).then((value) {
                              Toast.show(
                                  'then done',
                                  context,
                                  duration: Toast.LENGTH_SHORT,
                                  gravity:  Toast.BOTTOM
                              );
                              newValue = 2.0;
                            });

                            /// COUNTDOWN TIMER
                            countDownTimer();
                          }
                          // else {
                          //   _timer.cancel();
                          //   _timer = null;
                          //   loadImage('lib/assets/info_48.png').then((image) {
                          //     customImage = image;
                          //   });
                          // }
                        });
                      },
                    ),
                  ),
                )
              ]
          ),
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
  /// USING COUNTDOWN TIMER
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

class SliderCurrentCustomThumb extends SliderComponentShape {
  final dartUI.Image image;

  SliderCurrentCustomThumb(this.image);

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