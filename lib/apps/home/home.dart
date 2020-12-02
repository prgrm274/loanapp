import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          /// NG
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// BRS LOGO
            Row(
                children: <Widget>[
                  /// ALIGN NG
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      height: 50,
                      width: 125,
                      image: AssetImage('lib/assets/ojk_transparent.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 150,
                      height: 100,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Image(
                      height: 50,
                      width: 125,
                      image: AssetImage('lib/assets/dfix_transparent.png'),
                    ),
                  ),
                ]
            ),
            Table(
              children: [
                TableRow(
                    children: [
                      Container(
                        /// MARGIN: BATAS ATAS LOGO, BATAS BAWAH LOGO
                          margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            /// MISAL JIKA HANYA INGIN BARIS ATAS (DAN BAWAH)
                            /// DIKASIH LENGKUNG CURVED EDGE
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          // color: Colors.blue,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Anda terima ',
                                    style: TextStyle(color: Colors.blue[900], fontSize: 12),
                                  ),
                                ),
                                Image(
                                  height: 12,
                                  width: 12,
                                  image: AssetImage('lib/assets/info_48.png'),
                                ),
                                Align(
                                  /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.46,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Rp 1.500.000',
                                    style: TextStyle(color: Colors.blue[900], fontSize: 12),
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
                          margin: EdgeInsets.fromLTRB(10, 0.2, 10, 0),
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(color: Colors.white,),
                          padding: EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Anda mengembalikan',
                                    style: TextStyle(color: Colors.blue[900], fontSize: 12),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.355,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    'Rp 2.625.000',
                                    style: TextStyle(color: Colors.blue[900], fontSize: 12),
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
                        padding: EdgeInsets.all(10),
                        // color: Colors.blue,
                        child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Bayar hingga',
                                  style: TextStyle(color: Colors.blue[900], fontSize: 12),
                                ),
                              ),
                              Align(
                                /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.48,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Row(children: <Widget>[
                                    Image(
                                      height: 12,
                                      width: 12,
                                      image: AssetImage('lib/assets/info_48.png'),
                                    ),
                                    Text(
                                      '\t28.10.2020',
                                      style: TextStyle(color: Colors.blue[900], fontSize: 12),
                                    ),
                                  ])),
                            ]
                        )
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    Row(children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Cicilan per bulan',
                          style: TextStyle(color: Colors.blue[900], fontSize: 12),
                        ),
                      ),
                      Align(
                        /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.41,
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Row(children: <Widget>[
                            Text(
                              'Rp 525.000  ',
                              style: TextStyle(color: Colors.blue[900], fontSize: 12),
                            ),
                            Image(
                              height: 12,
                              width: 12,
                              image: AssetImage('lib/assets/info_48.png'),
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
                          ])),
                    ]),
                  ]
                )
              ],
            ),
          ]),
    );
  }
}
