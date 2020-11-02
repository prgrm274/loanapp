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
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

          /// NG
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// BRS LOGO
            Row(children: <Widget>[
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
            ]),
            Column(children: <Widget>[
              Container(

                  /// KONTAINER TEXT LIST
                  margin: EdgeInsets.fromLTRB(8, 40, 8, 0),
                  height: 200,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: ListView(children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: Colors.blue,
                        child: Row(children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Anda terima ',
                              style: TextStyle(color: Colors.blue[900]),
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
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                          ),
                        ])),
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: Colors.yellow,
                        child: Row(children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Anda mengembalikan',
                              style: TextStyle(color: Colors.blue[900]),
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
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                          ),
                        ])),
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: Colors.blue,
                        child: Row(children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Bayar hingga',
                              style: TextStyle(color: Colors.blue[900]),
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
                                  style: TextStyle(color: Colors.blue[900]),
                                ),
                              ])),
                        ])),
                    Container(
                        padding: EdgeInsets.all(10),
                        // color: Colors.blue,
                        child: Row(children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Cicilan per bulan',
                              style: TextStyle(color: Colors.blue[900]),
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
                                  style: TextStyle(color: Colors.blue[900]),
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
                        ])),
                  ])),
            ]),
          ]),
    );
  }
}
