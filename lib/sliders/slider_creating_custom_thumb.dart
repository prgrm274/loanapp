import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';

class SliderCreatingCustomThumb extends StatefulWidget {
  SliderCreatingCustomThumb({Key key}) : super(key: key);

  @override
  _SliderCreatingCustomThumbState createState() =>
      _SliderCreatingCustomThumbState();
}

class _SliderCreatingCustomThumbState extends State<SliderCreatingCustomThumb> {
  dartUI.Image customImage;
  double sliderValue = 0.0;

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
    return Scaffold(
      body: Column(
          children: <Widget>[
            Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 10,
                        thumbShape: SliderThumbImage(customImage),
                      ),
                      child: Slider(
                        divisions: 5,
                        label: sliderValue.toString(),
                        max: 10.0,
                        min: 0.0,
                        onChanged: (value) {
                          setState(() {/// ng
                            sliderValue = value;
                          });
                        },
                        onChangeStart: (value) {
                          if (value == 6.0) {
                            loadImage('lib/assets/calculator_thumb_bonus.png').then((image) {
                              customImage = image;
                            });
                          } else {
                            loadImage('lib/assets/info_48.png').then((image) {
                              customImage = image;
                            });
                          }
                        },
                        onChangeEnd: (value) {
                          setState(() {
                            if (value == 6.0) {
                              start();
                            }
                          });
                        },
                        value: sliderValue,
                      ),
                    ),
                  )
                ]
            ),
            Row(
                children: <Widget>[
                  Text(sliderValue.toString()),
                ]
            )
          ]
      ),
    );
  }

  ///
  /// TIMER
  Timer _timer;
  int _start = 2;
  // int _start = 2;

  void start(){
    const oneSec = const Duration(seconds: 4);
    _timer = new Timer.periodic(
        oneSec,
            (Timer timer) {
          setState(() {
            if (_start < 1) {
              _timer.cancel();

              /// SET THUMB VALUE TO FOR EXAMPLE 1.0
              sliderValue = 1.0;

            } else {
              _start = _start - 1;
            }
          });
        });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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