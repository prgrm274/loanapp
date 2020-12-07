import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/apps/product_calculator.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/apps/registrasi/reg_040b_otp.dart';

class PermissionRequestSblmPakeExpanded extends StatefulWidget {
  PermissionRequestSblmPakeExpanded({Key key}) : super(key: key);

  @override
  _PermissionRequestSblmPakeExpandedState createState() => _PermissionRequestSblmPakeExpandedState();
}

class _PermissionRequestSblmPakeExpandedState extends State<PermissionRequestSblmPakeExpanded> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,

          /// 'BARIS' UTAMA
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                    children: <Widget>[
                      /// 'BARIS' SELAMAT DATANG
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 1,
                          color: Colors.cyan[400],
                          child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                      text: 'Selamat datang di danafix'
                                  ),
                                  TextSpan(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    text: 'Izinkan kami menggunakan beberapa informasi pribadi dan non-pribadi '
                                        'Anda untuk memproses aplikasi Anda dan menyediakan layanan kami',
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ),

                      // ListTile(
                      //   dense: true,
                      //   contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      //   tileColor: Colors.cyan[400],
                      //   title: Text(
                      //       'Selamat datang di danafix',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(
                      //           color: Colors.white, fontSize: 22)
                      //   ),
                      // ),
                      //
                      // Container(
                      //   padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      //   color: Colors.cyan[400],
                      //   child: Text(
                      //     'Izinkan kami menggunakan beberapa informasi pribadi dan non-pribadi '
                      //         'Anda untuk memproses aplikasi Anda dan menyediakan layanan kami',
                      //     textAlign: TextAlign.center,
                      //     style: TextStyle(color: Colors.yellow[50], fontSize: 12),
                      //   ),
                      // ),

                      Align(
                        alignment: Alignment.center,
                        child: ListView(
                            shrinkWrap: true,
                            children: <Widget>[
                              Row(
                                  children: <Widget>[
                                    Container(height: 60),
                                    Spacer(),
                                  ]
                              ),

                              /// INFORMASI TELEPON
                              Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                              child: Icon(Icons.call),
                                            ),
                                            Expanded(
                                              child: Container(
                                                  padding: EdgeInsets.fromLTRB(0, 42, 15, 15),
                                                  child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(
                                                          'Informasi telepon',
                                                          textAlign: TextAlign.justify,
                                                          style: TextStyle(color: Colors.black),
                                                        ),
                                                        Text(
                                                          'Kami mencatat dan menggunakan informasi ponsel Anda, '
                                                              'seperti IMEI, informasi perangkat lunak, dll. '
                                                              'Untuk mendapatkan data statistik dan menganalisis '
                                                              'pengiriman layanan Aplikasi dan untuk '
                                                              'meningkatkan kinerja aplikasi di wilayah Anda',
                                                          textAlign: TextAlign.justify,
                                                          style: TextStyle(
                                                              color: Colors.grey[600],
                                                              fontSize: 12),
                                                        ),
                                                      ]
                                                  )
                                              ),
                                            )
                                          ]
                                      ),
                                    ),
                                  ]
                              ),

                              /// POSISI GEOGRAFIS
                              Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Row(
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                                child: Icon(Icons.location_pin),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                      padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                                                      child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: <Widget>[
                                                            Text(
                                                              'Posisi geografis',
                                                              textAlign: TextAlign.justify,
                                                              style: TextStyle(color: Colors.black),
                                                            ),
                                                            Text(
                                                                'Kami mencatat dan menggunakan posisi Anda '
                                                                    'untuk meningkatkan kinerja aplikasi di wilayah Anda',
                                                                textAlign: TextAlign.justify,
                                                                style: TextStyle(
                                                                    color: Colors.grey[600],
                                                                    fontSize: 12)
                                                            ),
                                                          ]
                                                      )
                                                  )
                                              )
                                            ]
                                        )
                                    )
                                  ]
                              ),

                              /// KAMERA
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                          child: Icon(Icons.camera_alt),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Kamera',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                Text(
                                                  'Kami menggunakan kamera Anda untuk mengambil '
                                                      'foto Anda dan mengunggahnya ke aplikasi Anda',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      color: Colors.grey[600],
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              /// 'baris' bawah
                              /*Row(
                        children: <Widget>[
                          Text('data'),
                          Spacer(),
                          Text('data'),
                        ]
                      )*/
                            ]
                        ),
                      ),

                      ///
                      /// Text Analisis Informasi dan Button Terima
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                          child: ListView(
                              children: <Widget>[
                                Divider(
                                  color: Colors.grey[600],
                                  height: 5,
                                  thickness: 0.5,
                                ),
                                Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Analisis informasi atas data yang dikumpulkan di atas "
                                                        "dilakukan secara otomatis. "
                                                        "Data Anda dienkripsi, diamankan, dan dikendalikan "
                                                        "untuk diakses oleh standar "
                                                        "yang berlaku dan merujuk pada ",
                                                    style: TextStyle(color: Colors.grey)
                                                ),
                                                TextSpan(
                                                  text: 'Syarat dan Ketentuan',
                                                  style: new TextStyle(
                                                      color: Colors.cyan[800],
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 11),
                                                  recognizer: new TapGestureRecognizer()..onTap = () {
                                                    print('LINK');
                                                  },
                                                ),
                                                TextSpan(
                                                    text: " dan ",
                                                    style: TextStyle(color: Colors.grey)
                                                ),
                                                TextSpan(
                                                  text: 'Kebijakan Privasi',
                                                  style: new TextStyle(
                                                      color: Colors.cyan[800],
                                                      decoration: TextDecoration.underline,
                                                      fontSize: 11),
                                                  recognizer: new TapGestureRecognizer()..onTap = () {
                                                    print('LINK');
                                                  },
                                                ),
                                              ]
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 95, 0, 5),
                                        width: double.infinity,
                                        child: RaisedButton(
                                          textColor: Colors.yellowAccent,
                                          padding: EdgeInsets.all(15),
                                          color: Colors.blue[800],
                                          // color: Theme.of(context).backgroundColor,
                                          onPressed: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (BuildContext context) =>
                                                        Reg040BOTP()
                                                )
                                            );
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: Text(
                                            'TERIMA',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
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
