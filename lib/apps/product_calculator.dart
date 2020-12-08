import 'dart:async';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/apps/logo_danafix.dart';
import 'package:voidrealm/apps/logo_ojk.dart';
import 'package:voidrealm/apps/text_dapatkan_sekarang.dart';
import 'package:voidrealm/apps/text_durasi_pinjaman.dart';
import 'package:voidrealm/apps/text_jumlah_pinjaman_rp.dart';
import 'package:voidrealm/apps/text_sudah_peminjam.dart';
import 'package:voidrealm/apps/texts/t_andamengembalikan_a_800rb.dart';
import 'package:voidrealm/apps/texts/t_andamengembalikan_b_1jt600rb.dart';
import 'package:voidrealm/apps/texts/t_andamengembalikan_c_2jt400rb.dart';
import 'package:voidrealm/apps/texts/t_andamengembalikan_d_3jt200rb.dart';
import 'package:voidrealm/apps/texts/t_andaterima_a_500rb.dart';
import 'package:voidrealm/apps/texts/t_andaterima_b_1jt.dart';
import 'package:voidrealm/apps/texts/t_andaterima_c_1jt500rb.dart';
import 'package:voidrealm/apps/texts/t_andaterima_d_2jt.dart';
import 'package:voidrealm/sliders/slider6_emoji.dart';
import 'package:voidrealm/sliders/slider7/slider7.dart';
import 'package:voidrealm/sliders/slider_widget_b.dart';
import 'package:voidrealm/sliders/slider_widget_b_thumb_shape.dart';
import 'package:voidrealm/sliders/slider_widget_b_thumb_shape_ng.dart';
import 'text_anda_terima_product_calc.dart';
import 'package:voidrealm/sliders/slider_custom.dart';
import 'package:voidrealm/sliders/slider_current_custom_future.dart';
import 'package:voidrealm/sliders/thumb_text_on_image.dart';
import 'package:voidrealm/sliders/slider_widget.dart';

class ProductCalculator extends StatefulWidget {
  ProductCalculator({Key key}) : super(key: key);

  @override
  _ProductCalculatorState createState() => _ProductCalculatorState();
}

class _ProductCalculatorState extends State<ProductCalculator> {
  double sliderValue = 0.0;/// INITIAL VALUE

  dartUI.Image customImage;
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
    loadImage('lib/assets/info_48.png').then((image) {/// v
      customImage = image;
    });
    super.initState();
  }

  TextAndaTerimaProductCalc text12 = new TextAndaTerimaProductCalc();

  List<Widget> _textUang = [
    TAndaTerimaA500rb(),
    TAndaTerimaB1jt(),
    TAndaTerimaC1jt500rb(),
    TAndaTerimaD2jt(),

    TAndaMengembalikanA800rb(),
    TAndaMengembalikanB1jt600rb(),
    TAndaMengembalikanC2jt400rb(),
    TAndaMengembalikanD3jt200rb(),
  ];

  /// BUAT METHOD DAN TARUH DI CHILD
  /// JADI TIDAK PERLU IF ELSE DI CHILD:
  Widget _setText() {
    if (sliderValue == 0.0) {
      return _textUang.elementAt(0);
    } else if (sliderValue == 1.0) {
      return _textUang.elementAt(1);
    } else if (sliderValue == 2.0) {
      return _textUang.elementAt(2);
    } else if (sliderValue == 3.0) {
      return _textUang.elementAt(3);
    } else {
      return _textUang.elementAt(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Container(
          color: Colors.cyan,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              /// OJK
              LogoOjk(),
              /// DANAFIX
              LogoDanafix(),
              /// COLUMN UNTUK TEXT TABLE
              Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  /// NG
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 129.8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          )
                        ],
                      ),
                      /// TEXT TABLE
                      child: Table(
                        children: [
                          /// 1. ANDA TERIMA
                          TableRow(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      /// MISAL JIKA HANYA INGIN BARIS ATAS (DAN BAWAH)
                                      /// DIKASIH LENGKUNG CURVED EDGE
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4)
                                      ),
                                    ),
                                    height: 48,
                                    /// MARGIN: BATAS ATAS LOGO, BATAS BAWAH LOGO
                                    // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    // padding: EdgeInsets.all(10),
                                    // width: MediaQuery.of(context).size.width * 1,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                                                    child: Text(
                                                      'Anda terima',
                                                      style: TextStyle(
                                                          color: Colors.blue[900],
                                                          fontSize: 13,
                                                          fontFamily: 'Sans'
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.calendar_today_outlined,
                                                    color: Colors.blueAccent,
                                                    size: 20,
                                                  ),
                                                ]
                                            ),
                                          ),
                                          // Image(
                                          //   height: 18,
                                          //   width: 18,
                                          //   image: AssetImage('lib/assets/info_48.png'),
                                          // ),
                                          // Align(
                                          //   /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                                          //   alignment: Alignment.center,
                                          //   child: Container(
                                          //     width: MediaQuery.of(context).size.width * 0.46,
                                          //   ),
                                          // ),
                                          Expanded(
                                              flex: 1,
                                              child: _setText()
                                            /// v
                                            // sliderValue > 4.0 ?
                                            // _textUang.elementAt(0) :
                                            // Container(
                                            //   alignment: Alignment.centerRight,
                                            //   margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            //   child: new Text(
                                            //     'Rp 1.500.000',
                                            //     style: TextStyle(
                                            //         color: Colors.blue[900],
                                            //         fontSize: 13,
                                            //         fontFamily: 'Sans'
                                            //     ),
                                            //   ),
                                            // ),
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          ),
                          /// 2. ANDA MENGEMBALIKAN
                          TableRow(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                          top: BorderSide(
                                              color: Colors.black,
                                              width: 0.3
                                          )
                                      ),
                                    ),
                                    height: 48,
                                    // margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    // padding: EdgeInsets.all(10),
                                    // width: MediaQuery.of(context).size.width * 1,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                                                    child: Text(
                                                      'Anda mengembalikan',
                                                      style: TextStyle(
                                                          color: Colors.blue[900],
                                                          fontSize: 13,
                                                          fontFamily: 'Sans'
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                          // Image(
                                          //   height: 18,
                                          //   width: 18,
                                          //   image: AssetImage('lib/assets/blank_white_icon.png'),
                                          // ),
                                          // Align(
                                          //   alignment: Alignment.topCenter,
                                          //   child: Container(
                                          //     width: MediaQuery.of(context).size.width * 0.38,
                                          //   ),
                                          // ),
                                          // Expanded(
                                          //   child: Container(
                                          //     width: MediaQuery.of(context).size.width * 0.40,
                                          //   ),
                                          // ),
                                          Expanded(
                                            flex: 1,
                                            child: sliderValue > 4.0 ?
                                            _textUang.elementAt(1)
                                                :
                                            Container(
                                              alignment: Alignment.centerRight,
                                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                              child: Text(
                                                'Rp 2.625.000',
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontSize: 13,
                                                    fontFamily: 'Sans'
                                                ),
                                              ),
                                            ),
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          ),
                          /// 3. BAYAR HINGGA
                          TableRow(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    height: 48,
                                    // margin: EdgeInsets.fromLTRB(10, 0.8, 10, 0),
                                    // padding: EdgeInsets.all(10),
                                    // width: MediaQuery.of(context).size.width * 1,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                                              child: Text(
                                                'Bayar hingga',
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontSize: 13,
                                                    fontFamily: 'Sans'
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Align(
                                          //   alignment: Alignment.center,
                                          //   child: Container(
                                          //     width: MediaQuery.of(context).size.width * 0.48,
                                          //   ),
                                          // ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.calendar_today_outlined,
                                                        color: Colors.blueAccent,
                                                        size: 20,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                        child: Text(
                                                          '28.10.2020',
                                                          style: TextStyle(
                                                              color: Colors.blue[900],
                                                              fontSize: 13,
                                                              fontFamily: 'Sans'
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                              )
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          ),
                          /// 4. CICILAN PER BULAN
                          TableRow(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)
                                    ),
                                  ),
                                  height: 48,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            child: Text(
                                              'Cicilan per bulan',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontFamily: 'Sans'
                                              ),
                                            ),
                                          ),
                                        ),

                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                            child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                    child: Text(
                                                      'Rp. 525.000',
                                                      style: TextStyle(
                                                          color: Colors.blue[900],
                                                          fontSize: 13,
                                                          fontFamily: 'Sans'
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.calendar_today_outlined,
                                                    color: Colors.blueAccent,
                                                    size: 20,
                                                  ),
                                                  // IconButton(
                                                  //   icon: Image(
                                                  //     height: 12,
                                                  //     width: 12,
                                                  //     image: AssetImage('lib/assets/info_48.png'),
                                                  //   ),
                                                  //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  // ),
                                                ]
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ]
                          )
                        ],
                      ),
                    ),
                  ]
              ),
              /// KARUNG UANG
              Container(
                // alignment: Alignment.topCenter,
                color: Colors.transparent,
                margin: EdgeInsets.fromLTRB(0, 86.8, 0, 0),
                child: Image(
                    height: 100,
                    width: 100,
                    image: AssetImage('lib/assets/karung_uang.png')
                ),
              ),
              /// TEXT, SLIDER, BUTTON
              Positioned(
                bottom: 10,
                child: Column(
                    children: <Widget>[
                      /// TEXT JUMLAH PINJAMAN
                      TextJumlahPinjamanRp(),
                      /// SLIDER
                      /// SliderCreatingCustomThumb PAKE COLUMN
                      /// DI SINI BERARTI COLUMN DALAM COLUMN BISA
                      // SliderCurrentCustomFuture(),
                      Column(
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
                                        thumbShape: sliderValue < 6.0 ?
                                        SliderThumbImage(customImage) :
                                        // RoundSliderThumbShape(enabledThumbRadius: 20),
                                        SliderWidgetBThumbShapeNg(
                                            enabledThumbRadius: 15,
                                            disabledThumbRadius: 4,
                                            valueTextSpan: TextSpan(
                                              text: sliderValue.toString()
                                            )
                                        ),
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
                                        fontSize: 12
                                    ),
                                  ),
                                ]
                            )
                          ]
                      ),
                      // SliderCurrent(),
                      /// TEXT DURASI PINJAMAN
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextDurasiPinjaman(),
                      ),
                      // ThumbTextOnImage(),

                      // Slider7(),
                      SliderWidgetB(),
                      // Slider6Emoji(),

                      /// TEXT SUDAH MENJADI PEMINJAM
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextSudahPeminjam(),
                      ),
                      /// BUTTON DAPATKAN DANA SEKARANG
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(0))
                        ),
                        margin: EdgeInsets.fromLTRB(0, 21, 0, 10),
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        width: MediaQuery.of(context).size.width * 1,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          color: Colors.blue[900],
                          onPressed: (){
                            print('Button dapatkan dana sekarang');
                          },
                          child: TextDapatkanSekarang(),
                        ),
                      )
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
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
  /// TIMER
  Timer _timer;
  int _start = 3;
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