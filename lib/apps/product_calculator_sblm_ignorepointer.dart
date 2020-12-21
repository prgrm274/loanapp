import 'dart:async';
import 'dart:ui' as dartUI;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';
// import 'package:popup_menu/popup_menu.dart';
import 'package:toast/toast.dart';
// import 'package:voidrealm/apps/logo_danafix.dart';
import 'package:voidrealm/apps/logo_danafix_in_stack.dart';
// import 'package:voidrealm/apps/logo_ojk.dart';
import 'package:voidrealm/apps/logo_ojk_in_stack.dart';
import 'package:voidrealm/apps/t_10m_akan_anda_terima.dart';
import 'package:voidrealm/apps/t_3m_akan_anda_terima.dart';
import 'package:voidrealm/apps/t_6m_akan_anda_terima.dart';
import 'package:voidrealm/apps/text_2625.dart';
import 'package:voidrealm/apps/text_525.dart';
import 'package:voidrealm/apps/text_anda_mengembalikan.dart';
import 'package:voidrealm/apps/text_cicilan_per_bulan.dart';
import 'package:voidrealm/apps/text_dapatkan_sekarang.dart';
import 'package:voidrealm/apps/text_durasi_pinjaman.dart';
import 'package:voidrealm/apps/text_sudah_peminjam.dart';
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
  String imgPathKarung = 'lib/assets/karung_uang.png';

  @override
  void initState() {
    loadImage(imgPathCalcThumbBonus).then((image) {/// v
      customImage = image;
    });
    super.initState();
  }

  /// BUAT METHOD _setText DAN TARUH DI CHILD
  /// JADI TIDAK PERLU IF ELSE DI CHILD
  List<Widget> _listUangWidget = [
    TAndaTerimaA500rb(),
    TAndaTerimaB1jt(),
    TAndaTerimaC1jt500rb(),
    TAndaTerimaD2jt()
  ];

  Widget setUang(String nominal) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Text(
        nominal,
        style: TextStyle(
            color: Colors.blue[900],
            fontSize: 13,
            fontFamily: 'Sans'
        ),
      ),
    );
  }

  Widget _setTextUangTerima() {
    if (sliderPnjm == 0.0) {
      return _listUangWidget.elementAt(0);
    } else if (sliderPnjm == 1.0) {
      return _listUangWidget.elementAt(1);
    } else if (sliderPnjm == 2.0) {
      return _listUangWidget.elementAt(2);
    } else if (sliderPnjm == 3.0) {
      return _listUangWidget.elementAt(3);
    } else {
      return _listUangWidget.elementAt(0);
    }
  }

  Widget _setTextUangKembali() {
    if (sliderPnjm == 0.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 800.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 875.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 954.000');
      }
    } else if (sliderPnjm == 2.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 1.600.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 1.750.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 1.902.000');
      }
    } else if (sliderPnjm == 4.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 2.400.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 2.625.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 2.850.000');
      }
    } else if (sliderPnjm == 6.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 3.200.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 3.500.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 3.804.000');
      }
    }
    return setUang('');
  }

  Widget _setTextCicilan() {
    if (sliderPnjm == 0.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 200.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 175.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 159.000');
      }
    } else if (sliderPnjm == 2.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 400.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 350.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 317.000');
      }
    } else if (sliderPnjm == 4.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 600.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 525.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 475.000');
      }
    } else if (sliderPnjm == 6.0) {
      if (sliderHari == 3.5) {
        return setUang('Rp 800.000');
      } else if (sliderHari == 4.5) {
        return setUang('Rp 700.000');
      } else if (sliderHari == 5.5) {
        return setUang('Rp 634.000');
      }
    }
    return setUang('');
  }

  TextSpan _setThumbValue() {
    if (sliderPnjm == 0.0) {
      return TextSpan(
          text: '500K',
          style: TextStyle(color: Colors.blue[900], fontSize: 12/*, fontWeight: FontWeight.bold*/)
      );
    } else if (sliderPnjm == 2.0) {
      return TextSpan(
          text: '1M',
          style: TextStyle(color: Colors.blue[900], fontSize: 12/*, fontWeight: FontWeight.bold*/)
      );
    } else if (sliderPnjm == 4.0) {
      return TextSpan(
          text: '1.5M',
          style: TextStyle(color: Colors.blue[900], fontSize: 12/*, fontWeight: FontWeight.bold*/)
      );
    } else if (sliderPnjm == 6.0) {
      return TextSpan(
          text: '2M',
          style: TextStyle(color: Colors.blue[900], fontSize: 12/*, fontWeight: FontWeight.bold*/)
      );
    }
  }

  Widget _setTable2MLebih() {
    if (sliderPnjm == 8) {
      return Table3MAkanAndaTerima();
    } else if (sliderPnjm == 10) {
      return Table6MAkanAndaTerima();
    } else if (sliderPnjm == 12) {
      return Table10MAkanAndaTerima();
    }
  }

  String _setThumbBonusValue() {
    if (sliderPnjm == 8.0) {
      return '3M';
    } else if (sliderPnjm == 10.0) {
      return '6M';
    } else if (sliderPnjm == 12.0) {
      return '10M';
    } return 'no';
  }

  bool _hasToIgnore = false;

  /// SUPER TOOLTIP
  SuperTooltip tooltip;
  Future<bool> _willPopCallback() async {
    // If the tooltip is open we don't pop the page on a backbutton press
    // but close the ToolTip
    if (tooltip.isOpen) {
      tooltip.close();
      return false;
    }
    return true;
  }

  void onTap() {
    if (tooltip != null && tooltip.isOpen) {
      tooltip.close();
      return;
    }

    var renderBox = context.findRenderObject() as RenderBox;
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    var targetGlobalCenter = renderBox
        .localToGlobal(renderBox.size.center(Offset.zero), ancestor: overlay);

    // We create the tooltip on the first use
    tooltip = SuperTooltip(
      popupDirection: TooltipDirection.left,
      arrowTipDistance: 15.0,
      arrowBaseWidth: 40.0,
      arrowLength: 20.0,
      borderColor: Colors.green,
      borderWidth: 5.0,
      // snapsFarAwayVertically: true,
      showCloseButton: ShowCloseButton.none,
      hasShadow: true,
      touchThrougArea: new Rect.fromLTWH(targetGlobalCenter.dx - 100,
          targetGlobalCenter.dy - 100, 200.0, 160.0),
      touchThroughAreaShape: ClipAreaShape.rectangle,
      content: new Material(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Besar pinjaman yang disetujui bisa sedikit berbeda setelah skor"
                  "pembayaran Anda dicek",
              softWrap: true,
            ),
          )),
    );

    tooltip.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _hasToIgnore,
      child: MaterialApp(
        home: Material(
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
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    /// ng
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(height: 110),
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
                        /// TEXT TABLE IS LEBIH DARI 2M (3M)
                        child: sliderPnjm > 6.0
                            ?
                        _setTable2MLebih()
                            :
                        Table(
                          children: [
                            /// 1. ANDA TERIMA
                            TableRow(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      print('tablerow anda terima');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4)
                                          ),
                                        ),
                                        height: 48,
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
                                              Expanded(
                                                  flex: 1,
                                                  child: _setTextUangTerima()
                                              ),
                                            ]
                                        )
                                    ),
                                  ),
                                ]
                            ),
                            /// 1. ANDA TERIMA 2
                            TableRow(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(4),
                                            topRight: Radius.circular(4)
                                        ),
                                      ),
                                      height: 48,
                                      child: WillPopScope(
                                        onWillPop: _willPopCallback,
                                        child: GestureDetector(
                                          onTap: onTap,
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
                                                Expanded(
                                                    flex: 1,
                                                    child: _setTextUangTerima()
                                                ),
                                              ]
                                          ),
                                        ),
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
                                              child: _setTextUangKembali(),
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
                                          bottom: BorderSide(
                                              color: Colors.black,
                                              width: 0.2
                                          ),
                                          top: BorderSide(
                                              color: Colors.black,
                                              width: 0.2
                                          ),
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
                                                      child: _setTextCicilan(),
                                                    ),
                                                    Icon(
                                                      Icons.calendar_today_outlined,
                                                      color: Colors.red,
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
                  margin: EdgeInsets.fromLTRB(0, 55, 0, 0),
                  child: Image(
                      height: 100,
                      width: 100,
                      image: AssetImage(imgPathKarung)
                  ),
                ),
                /// TEXT, SLIDER, BUTTON
                Positioned(
                  bottom: 5,
                  child: Column(
                      children: <Widget>[
                        /// TEXT JUMLAH PINJAMAN
                        Text(
                          'Jumlah pinjaman Rp',
                          style: TextStyle(
                            color: Colors.white70,
                            // fontSize: 12
                          ),
                        ),
                        /// SLIDER PINJAMAN
                        /// SliderCreatingCustomThumb PAKE COLUMN
                        /// DI SINI BERARTI COLUMN DALAM COLUMN BISA
                        // SliderCurrentCustomFuture(),
                        Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                width: MediaQuery.of(context).size.width * 1,
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    /// WARNA AKTIF
                                    activeTickMarkColor: Colors.white,
                                    // activeTickMarkColor: sliderValue <= 4.0 ? Colors.amber : Colors.brown,
                                    activeTrackColor: Colors.white,/// null = WITHOUT TRACK
                                    disabledActiveTickMarkColor: Colors.white,
                                    disabledActiveTrackColor: sliderPnjm > 6
                                        ?
                                    Colors.white24
                                        :
                                    Colors.white,
                                    disabledInactiveTickMarkColor: Colors.blue[900],
                                    disabledInactiveTrackColor: Colors.white24,
                                    // disabledThumbColor: Colors.lightGreenAccent,
                                    inactiveTickMarkColor: Colors.blue[900],
                                    // inactiveTickMarkColor: Colors.brown,
                                    inactiveTrackColor: Colors.white24,
                                    // inactiveTrackColor: Colors.cyan[100],

                                    /// GA PAKE OVERLAY
                                    // overlayShape: RoundSliderOverlayShape(overlayRadius: 40.0),
                                    // rangeThumbShape: RoundRangeSliderThumbShape(
                                    //   elevation: 40,
                                    //   disabledThumbRadius: 5,
                                    //   enabledThumbRadius: 10,
                                    //   pressedElevation: 10
                                    // ),
                                    thumbColor: Colors.white,/// GA NGARUH
                                    thumbShape: sliderPnjm > 6
                                        ?
                                    SliderThumbImage(
                                        customImage,
                                        TextSpan(
                                            text: _setThumbBonusValue(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12
                                            )
                                        )
                                    )
                                        :
                                    // RoundSliderThumbShape(enabledThumbRadius: 20),
                                    SliderWidgetBThumbShapeNg(
                                        enabledThumbRadius: 20,
                                        disabledThumbRadius: 4,
                                        valueTextSpan: _setThumbValue()
                                    ),
                                    trackHeight: 2,//10
                                    trackShape: RoundedRectSliderTrackShape(),
                                    tickMarkShape: RoundSliderTickMarkShape(
                                      /// TICKMARKRADIUS MENENTUKAN TAMPIL NGGANYA TICKMARK
                                      /// 10 DISINI PERNAH KEBESAREN DAN GA TAMPIL
                                      /// KAYAKNYA ADA HUBUNGANNYA DGN DIVISION DAN MAX
                                      /// 5 PAS UTK BOTH EMULATOR, KECIL PIXEL 4 BESAR DIKIT DI PIXEL 3
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

                                        if (sliderPnjm > 6.0) {
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
                                        if (value > 6.0) {
                                          loadImage(imgPathCalcThumbBonus)
                                              .then((image) {
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
                                      sliderPnjm = newValue;

                                      if (sliderPnjm > 6.0) {

                                        setState(() {
                                          _hasToIgnore = true;/// ng
                                        });

                                        loadImage(imgPathCalcThumbBonus)
                                            .then((image) {
                                          customImage = image;
                                        });

                                        /// SEBELUMNYA GA PAKE FUNGSI (LANGSUNG DI SINI)
                                        _futureDelayedThumb();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ]
                        ),

                        /// SLIDER TIDAK FLEKSIBEL DISINI
                        /// MGKN HARUS PAKE Flexible
                        ///
                        /// LABEL NOMINAL PINJAMAN DI BAWAH SLIDER
                        /// POSITIONED ITU POSISI ABSOLUT
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          width: MediaQuery.of(context).size.width * 1.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 0.0 ? Text('') :
                                  Text(
                                      '500K',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 2.0 ? Text('') :
                                  Text(
                                      '1M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 0, right: 0),
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 4.0 ? Text('') :
                                  Text(
                                      '1.5M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 6.0 ? Text('') :
                                  Text(
                                      '2M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 8.0 ? Text('') :
                                  Text(
                                      '3M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 10.0 ? Text('') :
                                  Text(
                                      '6M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width/9,
                                  child: sliderPnjm == 12.0 ? Text('') :
                                  Text(
                                      '10M',
                                      style: TextStyle(color: Colors.white, fontSize: 10)
                                  )
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

                        /// SEKEDAR LABEL VALUE SLIDER
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: <Widget>[
                        //       Text(
                        //         sliderValue.toInt().toString(),
                        //         style: TextStyle(
                        //             fontSize: 12
                        //         ),
                        //       ),
                        //     ]
                        // ,

                        /// TEXT DURASI PINJAMAN
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: TextDurasiPinjaman(),
                        ),

                        /// SLIDER HARI
                        /// BUNGKUS DGN CONTAINER SUPAYA BISA DIATUR WIDTH NYA
                        Container(
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
                                  enabledThumbRadius: 20,
                                  disabledThumbRadius: 4,
                                  valueTextSpan: TextSpan(
                                      text: sliderHari.toString(),
                                      style: TextStyle(color: Colors.blue[900])
                                  )
                              ),
                              trackHeight: 2,//10
                              trackShape: RoundedRectSliderTrackShape(),
                              tickMarkShape: RoundSliderTickMarkShape(
                                  tickMarkRadius: 8
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

                        /// LABEL DURASI HARI DI BAWAH SLIDER
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
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
                                            sliderHari == 3.5 ? '' :
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
                                            sliderHari == 4.5 ? '' :
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
                                          sliderHari == 5.5 ? '' :
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

                        /// TEXT SUDAH MENJADI PEMINJAM
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: TextSudahPeminjam(),
                        ),

                        /// BUTTON DAPATKAN DANA SEKARANG
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(0))
                          ),
                          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                )
              ],
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
        Duration(seconds: 2),
            (){
          /// v
          // Toast.show(
          //     'DURATION 4s, sliderValue =  $sliderPnjm',
          //     context,
          //     duration: Toast.LENGTH_SHORT,
          //     gravity: Toast.BOTTOM
          // );
          setState(() {
            sliderPnjm = 2.0;
          });
        }).whenComplete(() => {
      // sliderValue = 2.0

      /// ng v
      /// MUNCUL PAS THUMB MENUJU KE SLIDER VALUE 1M
      ((){
        _hasToIgnore = false;

        /// v
        // Toast.show(
        //     'WHEN COMPLETE sliderValue = $sliderPnjm',
        //     context,
        //     duration: Toast.LENGTH_SHORT,
        //     gravity: Toast.BOTTOM
        // )
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

    /// ng TEXT DI TENGAH THUMB
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
        valueTextSpan.text.length > 2 ?
        center - (Offset(12, 8)) :
        center - (Offset(8, 8))
      // center-(Offset(10, 10))
    );
  }
}

/// CUSTOM TRACK SHAPE
///
class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

/// CUSTOM TICK MARK
///
class CustomTickMark extends RoundSliderTickMarkShape {

  @override
  Size getPreferredSize(
      {@required SliderThemeData sliderTheme, bool isEnabled = false}) {
  }

  @override
  void paint(PaintingContext context, Offset center,
      {@required RenderBox parentBox,
        @required SliderThemeData sliderTheme,
        @required Animation<double> enableAnimation,
        @required TextDirection textDirection,
        @required Offset thumbCenter,
        bool isEnabled = false}) {
  }
}