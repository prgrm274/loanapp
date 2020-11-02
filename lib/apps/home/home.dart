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
            Row(children: <Widget>[
              /// ALIGN NG
              Align(
                alignment: Alignment.topLeft,
                child: Image(
                  image: AssetImage('lib/assets/ojk_transparent.png'),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 110,
                  height: 100,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  height: 75,
                  width: 150,
                  image: AssetImage('lib/assets/dfix_transparent.png'),
                ),
              ),
            ]),
            Column(children: <Widget>[
              Container(/// KONTAINER TEXT LIST
                margin: EdgeInsets.fromLTRB(8, 40, 8, 0),
                height: 200,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Anda terima',
                            ),
                          ),
                          Image(
                            height: 24,
                            width: 24,
                            image: AssetImage('lib/assets/info_48.png'),
                          ),
                          Align(
                            /// BERI JARAK ANTARA anda terima DAN rp 1,5jt
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Rp 1.500.000',
                            ),
                          ),
                        ]
                      )
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.yellow,
                        child: Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Anda mengembalikan',
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
                                ),
                              ),
                            ]
                        )
                    ),
                  ]
                )
              ),
            ]),
          ]),
    );
  }
}
