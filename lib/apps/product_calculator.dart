import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
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
    Text('text 0'),
    Text('text 2'),
    Text('text 4'),
    Text('text 6'),
  ];

  static bool _text0 = false, _text1 = false;

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
              /// OJK DAN DANAFIX
              Positioned(
                left: 0,
                top: 20,
                child: GestureDetector(
                  onTap: (){
                    Toast.show("onTap gesture detector\nojk_transparent", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  },
                  child: Image(
                    height: 50,
                    width: 125,
                    image: AssetImage('lib/assets/ojk_transparent.png'),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Toast.show("onTap gesture detector\ndfix_transparent", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                  },
                  child: Image(
                    height: 50,
                    width: 125,
                    image: AssetImage('lib/assets/dfix_transparent.png'),
                  ),
                ),
              ),
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
                                                    child: Text(
                                                      'Anda terima  ',
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
                                            child: _text0 ?
                                            _textUang.elementAt(0)
                                            // new Text(
                                            //   'Rp 1',
                                            //   style: TextStyle(
                                            //       color: Colors.blue[900],
                                            //       fontSize: 13,
                                            //       fontFamily: 'Sans'
                                            //   ),
                                            // )
                                                :
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: new Text(
                                                'Rp 1.500.000',
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
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Anda mengembalikan',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontFamily: 'Sans'
                                              ),
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Rp 2.625.000',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontFamily: 'Sans'
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
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Bayar hingga',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontFamily: 'Sans'
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
                                              child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.calendar_today_outlined,
                                                      color: Colors.blueAccent,
                                                      size: 20,
                                                    ),
                                                    Text(
                                                      '  28.10.2020',
                                                      style: TextStyle(
                                                          color: Colors.blue[900],
                                                          fontSize: 13,
                                                          fontFamily: 'Sans'
                                                      ),
                                                    ),
                                                  ]
                                              )
                                          ),
                                        ]
                                    )
                                ),
                              ]
                          ),
                          /// 4. CICILAN PER BULAN
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
                      Text(
                        'Jumlah pinjaman Rp',
                        style: TextStyle(
                            color: Colors.white70
                        ),
                      ),
                      /// SLIDER
                      /// SliderCreatingCustomThumb PAKE COLUMN
                      /// DI SINI BERARTI COLUMN DALAM COLUMN BISA
                      GestureDetector(
                        onTap: (){
                          _text0 = true;
                        },
                        child: SliderCurrentCustomFuture(),
                      ),
                      // SliderCurrent(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'Durasi pinjaman, dalam satuan bulan',
                          style: TextStyle(
                              color: Colors.white70
                          ),
                        ),
                      ),
                      // SliderWidget(),
                      ThumbTextOnImage(),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'SUDAH MENJADI PEMINJAM',
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
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
                          child: Text(
                            'DAPATKAN DANA SEKARANG!',
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16
                            ),
                          ),
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