import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/apps/home/text_anda_terima_product_calc.dart';
import 'package:voidrealm/sliders/slider_current_custom.dart';
import 'package:voidrealm/sliders/slider_current_custom_future.dart';
import 'package:voidrealm/sliders/slider_widget.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextAndaTerimaProductCalc text12 = new TextAndaTerimaProductCalc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Container(
          color: Colors.cyan,
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
                    /// LIST OF TEXT
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
                      child: Table(
                        children: [
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
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 1,
                                    // color: Colors.blue,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.center,
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
                                          // Image(
                                          //   height: 18,
                                          //   width: 18,
                                          //   image: AssetImage('lib/assets/info_48.png'),
                                          // ),
                                          Align(
                                            /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.46,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              'Rp 1.500.000',
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: 13,
                                                  fontFamily: 'Sans'
                                              ),
                                            ),
                                          ),
                                        ]
                                    )
                                )
                              ]
                          ),
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
                                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 1,
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.40,
                                            ),
                                          ),
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
                          TableRow(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    height: 48,
                                    margin: EdgeInsets.fromLTRB(10, 0.8, 10, 0),
                                    padding: EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width * 1,
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width * 0.48,
                                            ),
                                          ),
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
                                  margin: EdgeInsets.fromLTRB(10, 0.8, 10, 0),
                                  padding: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Cicilan per bulan    ',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 13,
                                                fontFamily: 'Sans'
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.41,
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    'Rp 525.000  ',
                                                    style: TextStyle(
                                                        color: Colors.blue[900],
                                                        fontSize: 13,
                                                        fontFamily: 'Sans'
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
                                                  //   onPressed: () {
                                                  //     print('Cicilan');
                                                  //   },
                                                  //   padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  // ),
                                                ]
                                            )
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
                      /// KALO DI SINI BERARTI COLUMN DALAM COLUMN BISA
                      SliderCurrentFuture(),
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
                      SliderWidget(),
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
