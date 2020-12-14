import 'dart:async';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/apps/logo_danafix.dart';
import 'package:voidrealm/apps/logo_ojk.dart';
import 'package:voidrealm/apps/text_2625.dart';
import 'package:voidrealm/apps/text_525.dart';
import 'package:voidrealm/apps/text_anda_mengembalikan.dart';
import 'package:voidrealm/apps/text_cicilan_per_bulan.dart';
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
import 'package:voidrealm/sliders/slider_widget_b_thumb_shape_ng_hari.dart';
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
  /// INITIAL VALUE OF SLIDERS
  double sliderPnjm = 0.0;
  // double sliderHari = 1;
  double sliderHari = 4.5;

  dartUI.Image customImage;
  Future<dartUI.Image> loadImage(String pathOfAsset) async {
    ByteData data = await rootBundle.load(pathOfAsset);
    dartUI.Codec codec = await dartUI.instantiateImageCodec(
        data.buffer.asUint8List()
    );
    dartUI.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }
  String imgPathCalcThumbBonus = 'lib/assets/calculator_thumb_bonus.png';
  String imgPathOther = 'lib/assets/info_48.png';
  String imgPathKarung = 'lib/assets/karung_uang.png';

  @override
  void initState() {
    loadImage('lib/assets/info_48.png').then((image) {/// v
      customImage = image;
    });
    super.initState();
  }

  TextAndaTerima text12 = new TextAndaTerima();

  /// BUAT METHOD _setText DAN TARUH DI CHILD
  /// JADI TIDAK PERLU IF ELSE DI CHILD
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

  Widget _setText() {
    if (sliderPnjm == 0.0) {
      return _textUang.elementAt(0);
    } else if (sliderPnjm == 1.0) {
      return _textUang.elementAt(1);
    } else if (sliderPnjm == 2.0) {
      return _textUang.elementAt(2);
    } else if (sliderPnjm == 3.0) {
      return _textUang.elementAt(3);
    } else {
      return _textUang.elementAt(0);
    }
  }

  bool _hasToIgnore = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _hasToIgnore,
      child: MaterialApp(
        home: Material(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              color: Color.fromRGBO(0, 200, 220, 1),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  /// OJK
                  LogoOjk(),
                  /// DANAFIX
                  LogoDanafix(),
                  /// COLUMN UNTUK TEXT TABLE
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        /// NG
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
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
                                                          child: TextAndaTerima(),
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
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.black,
                                                    width: 0.2
                                                )
                                            ),
                                            color: Colors.white,
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
                                                          child: TextAndaMengembalikan(),
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
                                                  child: sliderPnjm > 4.0 ?
                                                  _textUang.elementAt(1)
                                                      :
                                                  Container(
                                                    alignment: Alignment.centerRight,
                                                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                                    child: Text2625(),
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
                                        // / MENGGUNAKAN MARGIN (AGAR TAMPAK SEPERTI BORDER)
                                        //   margin: EdgeInsets.fromLTRB(0, 0.8, 0, 0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                top: BorderSide(
                                                    color: Colors.black,
                                                    width: 0.2
                                                )
                                            ),
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
                                        /// MENGGUNAKAN MARGIN (AGAR TAMPAK SEPERTI BORDER)
                                        margin: EdgeInsets.fromLTRB(0, 0.8, 0, 0),
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
                                                  child: TextCicilanPerBulan(),
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
                                                          child: Text525(),
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
                  ),
                  /// KARUNG UANG
                  Container(
                    // alignment: Alignment.topCenter,
                    color: Colors.transparent,
                    margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Image(
                        height: 100,
                        width: 100,
                        image: AssetImage(imgPathKarung)
                    ),
                  ),

                  /// KUMPULAN
                  /// SEMUA YG DIBAWAH KECUALI LABEL SLIDER
                  /// KARENA AGAR BISA NGATUR POSISI LABEL BISA MEPET
                  Positioned(
                    bottom: 10,
                    child: Column(
                        children: <Widget>[
                          /// TEXT JUMLAH PINJAMAN
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: TextJumlahPinjamanRp(),
                          ),

                          /// SLIDER PINJAMAN
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: SliderTheme(
                              data: SliderThemeData(
                                /// WARNA AKTIF
                                activeTickMarkColor: Colors.white,
                                activeTrackColor: Colors.white,/// null WITHOUT TRACK
                                disabledActiveTickMarkColor: Colors.white,
                                disabledActiveTrackColor: Colors.green,
                                disabledInactiveTrackColor: Colors.white24,
                                disabledInactiveTickMarkColor: Colors.blue[900],
                                disabledThumbColor: Colors.lightGreenAccent,
                                // activeTrackColor: Colors.yellowAccent,
                                // activeTickMarkColor: sliderValue <= 4.0 ? Colors.amber : Colors.brown,
                                inactiveTickMarkColor: Colors.blue[900],
                                inactiveTrackColor: Colors.white24,
                                // inactiveTrackColor: Colors.cyan[100],
                                // inactiveTickMarkColor: Colors.brown,

                                /// GA PAKE OVERLAY
                                // overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
                                // rangeThumbShape: RoundRangeSliderThumbShape(
                                //   elevation: 40,
                                //   disabledThumbRadius: 5,
                                //   enabledThumbRadius: 10,
                                //   pressedElevation: 10
                                // ),
                                thumbColor: Colors.white,
                                thumbShape: sliderPnjm < 6.0
                                    ?
                                SliderWidgetBThumbShapeNg(
                                    enabledThumbRadius: 20,//15,
                                    disabledThumbRadius: 4,
                                    valueTextSpan: TextSpan(
                                        text: sliderPnjm.toInt().toString()+'M',
                                        style: TextStyle(color: Colors.blue[900])
                                    )
                                )
                                    :
                                // RoundSliderThumbShape(enabledThumbRadius: 20),
                                SliderThumbImage(
                                    customImage,
                                    TextSpan(
                                        text: sliderPnjm.toInt().toString()+'M',
                                        style: TextStyle(color: Colors.blue[900])
                                    )
                                ),
                                // SliderThumbImage(customImage),
                                trackHeight: 2,//10
                                trackShape: RoundedRectSliderTrackShape(),
                                tickMarkShape: RoundSliderTickMarkShape(
                                  /// TICKMARKRADIUS MENENTUKAN TAMPIL NGGANYA TICKMARK
                                  /// 10 DISINI PERNAH KEBESAREN DAN GA TAMPIL
                                  /// KAYAKNYA ADA HUBUNGANNYA DGN DIVISION DAN MAX
                                    tickMarkRadius: 5//10
                                ),
                                /// WARNA LABEL (CALLOUT)
                                // valueIndicatorColor: Colors.red,
                              ),
                              child: Slider(
                                divisions: 6,//5,
                                /// CALLOUT DI ATAS THUMB
                                // label: sliderValue.toString(),
                                min: 0.0,
                                max: 12,//10.0,
                                value: sliderPnjm,
                                onChanged: /// ng CONDITIONAL PAKE IgnorePointer
                                _hasToIgnore
                                    ?
                                null
                                    :
                                    (value) {/// REQUIRED

                                  setState(() {/// ng
                                    sliderPnjm = value;

                                    if (sliderPnjm > 4.0) {
                                      loadImage(imgPathCalcThumbBonus)
                                          .then((image) {
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
                                    if (value > 4.0) {
                                      loadImage(imgPathCalcThumbBonus).then((image) {
                                        customImage = image;
                                      });
                                    }
                                    // else {
                                    //   loadImage(imgPathOther).then((image) {
                                    //     customImage = image;
                                    //   });
                                    // }
                                  });
                                },

                                /// This callback shouldn't be used to update the slider
                                /// value (use onChanged for that), but rather to know
                                /// when the user has completed selecting a new value
                                /// by ending a drag or a click.
                                onChangeEnd: (newValue) {
                                  sliderPnjm = newValue;

                                  // setState(() {
                                  if (sliderPnjm > 4.0) {

                                    setState(() {
                                      _hasToIgnore = true;/// ng
                                    });

                                    loadImage(imgPathCalcThumbBonus).then((image) {
                                      customImage = image;
                                    });

                                    /// SEBELUMNYA GA PAKE FUNGSI (LANGSUNG DI SINI)
                                    _futureDelayedThumb();

                                    // start();
                                  }
                                  // else {
                                  //   if (_timer != null) {
                                  //     _timer.cancel();
                                  //     _timer = null;
                                  //     loadImage('lib/assets/info_48.png').then((image) {
                                  //       customImage = image;
                                  //     });
                                  //   }
                                  // }
                                  // });
                                },
                              ),
                            ),
                          ),

                          /// TEXT DURASI PINJAMAN
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                            child: TextDurasiPinjaman(),
                          ),

                          /// SLIDER
                          /// SliderCreatingCustomThumb PAKE COLUMN
                          /// DI SINI BERARTI COLUMN DALAM COLUMN BISA
                          // SliderCurrentCustomFuture(),

                          /// SLIDER HARI
                          /// BUNGKUS DGN CONTAINER SUPAYA BISA DIATUR WIDTH NYA
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: SliderTheme(
                              data: SliderThemeData(
                                activeTickMarkColor: Colors.white,
                                activeTrackColor: Colors.white,
                                disabledThumbColor: Colors.red,
                                inactiveTickMarkColor: Colors.white,
                                inactiveTrackColor: Colors.white24,
                                thumbColor: Colors.white,
                                thumbShape: SliderWidgetBThumbShapeNgHari(
                                    enabledThumbRadius: 20,//15,
                                    disabledThumbRadius: 4,
                                    valueTextSpan: TextSpan(
                                        text: sliderHari.toString(),
                                        style: TextStyle(color: Colors.blue[900])
                                    )
                                ),
                                trackHeight: 2,//10
                                trackShape: RoundedRectSliderTrackShape(),
                                tickMarkShape: RoundSliderTickMarkShape(
                                    tickMarkRadius: 6
                                ),
                              ),
                              child: Slider(
                                divisions: 2,
                                min: 3.5,
                                max: 5.5,
                                value: sliderHari,
                                onChanged: (value) {
                                  /// MISAL GA PAKE SETSTATE MAKA SLIDER GA AKAN MOVE
                                  setState(() {
                                    sliderHari = value;
                                  });
                                },
                                onChangeStart: (value) {

                                },
                                onChangeEnd: (value) {

                                },
                              ),
                            ),
                          ),

                          // SliderCurrent(),
                          // ThumbTextOnImage(),
                          // Slider7(),
                          // SliderWidgetB(),/// v
                          // Slider6Emoji(),

                          /// TEXT SUDAH MENJADI PEMINJAM
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: TextSudahPeminjam(),
                          ),

                          /// BUTTON DAPATKAN DANA SEKARANG
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(0))
                            ),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                              color: Colors.blue[900],
                              onPressed: (){
                                print('Button dapatkan dana sekarang');
                              },
                              child: TextDapatkanSekarang(),
                            ),
                          )
                        ]
                    ),
                  ),

                  /// LABEL NOMINAL PINJAMAN DI BAWAH SLIDER
                  /// POSITIONED ITU POSISI ABSOLUT, SEAKAN MELAYANG
                  Positioned(
                    bottom: 170,
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 40),
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * 1.000000,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                '500K',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '1M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '1.5M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '2M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '3M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '6M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          Expanded(
                            child: Text(
                                '10M',
                                style: TextStyle(color: Colors.white, fontSize: 10)
                            ),
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('500K'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('1M'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 9,
                          //   child: Text('1.5M'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('2M'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('3M'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('6M'),
                          // ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 7.5,
                          //   child: Text('10M'),
                          // ),
                        ],
                        // children: List.generate(
                        //     7, (index) {
                        //   return Text("$index");
                        // }),
                      ),
                    ),
                  ),

                  /// LABEL DURASI HARI DI BAWAH SLIDER
                  Positioned(
                    bottom: 90,
                    child: Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: MediaQuery.of(context).size.width * 1.25,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                  children: <Widget>[
                                    Text(
                                        '3.5',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10
                                        )
                                    ),
                                    Text(
                                        '(104 hari)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10
                                        )
                                    )
                                  ]
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                  children: <Widget>[
                                    Text(
                                        '4.5',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10
                                        )
                                    ),
                                    Text(
                                        '(134 hari)',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10
                                        )
                                    )
                                  ]
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                  children: <Widget>[
                                    Text(
                                      '5.5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    ),
                                    Text(
                                      '(164 hari)',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      ),
                                    )
                                  ]
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// SEBELUMNYA GA PAKE FUNGSI (LANGSUNG DI WIDGET SLIDER)
  /// ng
  void _futureDelayedThumb() {
    Future.delayed(
        Duration(seconds: 4),
            (){
          Toast.show(
              '4s already, sliderValue =  $sliderPnjm',
              context,
              duration: Toast.LENGTH_SHORT,
              gravity: Toast.BOTTOM
          );
          setState(() {
            sliderPnjm = 2.0;
          });
        }).whenComplete(() => {
      // sliderValue = 2.0

      /// NG v
      /// MUNCUL PAS THUMB MENUJU KE SLIDER VALUE 1M
      ((){
        _hasToIgnore = false;

        Toast.show(
            'WHEN COMPLETE sliderValue = $sliderPnjm ',
            context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.BOTTOM
        );
      }())
    });
  }

  @override
  void dispose() {
    Toast.show(
        'dispose()',
        context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM
    );

    // if (_timer != null) {
    //   _timer.cancel();
    //   _timer = null;/// NG
    // }
    // _timer.cancel();
    super.dispose();
  }

  ///
  /// TIMER
  // Timer _timer;
  int _start = 3;
}

class SliderThumbImage extends SliderComponentShape {
  final dartUI.Image image;
  final TextSpan valueTextSpan;

  SliderThumbImage(
      this.image,
      this.valueTextSpan);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(0, 0);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center,
      {
        Animation<double> activationAnimation,
        Animation<double> enableAnimation,
        bool isDiscrete,
        TextPainter labelPainter,
        RenderBox parentBox,
        SliderThemeData sliderTheme,
        TextDirection textDirection,
        double value,
        double textScaleFactor,
        Size sizeWithOverflow
      }) {
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

    /// ng v TEXT DI TENGAH THUMB
    // TextSpan span = new TextSpan(
    //     style: new TextStyle(
    //         color: Colors.grey[600]),
    //     text: '15M'
    // );
    labelPainter = new TextPainter(
        text: valueTextSpan,
        // text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    labelPainter.layout();
    labelPainter.paint(
        canvas,
        center-(Offset(10, 10))
    );
  }
}