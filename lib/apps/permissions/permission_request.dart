import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/apps/product_calculator.dart';
import 'file:///D:/JUNED/PROJECTS/Flutter_Voidrealm/voidrealm/lib/apps/registrasi/reg_040b_otp.dart';

class PermissionRequest extends StatefulWidget {
  PermissionRequest({Key key}) : super(key: key);

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: AppBar(
              backgroundColor: Colors.cyan[400],
              elevation: 0,
              // flexibleSpace: Container(
              //   child: Text('flexible space'),
              // ),
              toolbarHeight: 100,
              title:/// 'BARIS' SELAMAT DATANG
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: MediaQuery.of(context).size.width * 1,
                child: RichText(
                  /// BACK NAVIGATION ICON
                  /// Custom leading icon, such as back navigation icon or other
                  /// warna kotaknya navigation icon
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 22),
                            text: 'Selamat datang di danafix'),
                        TextSpan(
                            text: '\n\n'
                        ),
                        TextSpan(
                          style: TextStyle(color: Colors.white, fontSize: 12),
                          text:
                          'Izinkan kami menggunakan beberapa informasi pribadi dan non-pribadi '
                              'Anda untuk memproses aplikasi Anda dan menyediakan layanan kami',
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
            // height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            /// 'BARIS' UTAMA
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
                  child: Column(
                      children: <Widget>[
                        /// INFORMASI TELEPON
                        Container(
                          child: Row(
                              children: <Widget>[
                                Column(
                                    children: <Widget>[
                                      Container(
                                        /// BOTTOM 40 MASIN ICON DI TOP SESUAI JUMLAH KATA 'kami mencatat'
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 55),
                                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                        child: Icon(Icons.call, color: Colors.cyan),
                                      )
                                    ]
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(0, 0, 15, 30),
                                    child: RichText(
                                      textAlign: TextAlign.justify,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                            'Informasi telepon',
                                            style: TextStyle(
                                                color: Colors.black
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            '\nKami mencatat dan menggunakan informasi ponsel Anda, '
                                                'seperti IMEI, informasi perangkat lunak, dll. '
                                                'Untuk mendapatkan data statistik dan menganalisis '
                                                'pengiriman layanan Aplikasi dan untuk '
                                                'meningkatkan kinerja aplikasi di wilayah Anda',
                                            style: TextStyle(
                                                color: Colors.grey[600], fontSize: 12
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]
                          ),
                        ),

                        /// POSISI GEOGRAFIS
                        Container(
                          child: Row(
                              children: <Widget>[
                                Column(
                                    children: <Widget>[
                                      Container(
                                        /// BOTTOM 5 MASIN ICON DI TOP SESUAI JUMLAH KATA
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                        child: Icon(Icons.location_pin, color: Colors.cyan),
                                      ),
                                    ]
                                ),
                                Expanded(
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 15, 30),
                                      child: RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                              'Posisi geografis',
                                              style: TextStyle(
                                                  color: Colors.black
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                              '\nKami mencatat dan menggunakan posisi Anda untuk '
                                                  'meningkatkan kinerja aplikasi di wilayah Anda',
                                              style: TextStyle(
                                                  color: Colors.grey[600], fontSize: 12
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ]
                          ),
                        ),

                        /// KAMERA
                        Container(
                          child: Row(
                            children: <Widget>[
                              Column(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                      child: Icon(Icons.camera_alt, color: Colors.cyan),
                                    ),
                                  ]
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                            color: Colors.grey[600], fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                  ),
                ),

                ///
                /// ANALISIS INFORMASI DAN BUTTON
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Column(
                        children: <Widget>[
                          Divider(
                            color: Colors.grey[300],
                            height: 5,
                            thickness: 2,
                          ),

                          Container(
                            /// TOP JARAK KE LINE
                            /// BOTTOM JARAK KE BUTTON TERIMA
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                        "Analisis informasi atas data yang dikumpulkan di atas "
                                            "dilakukan secara otomatis. "
                                            "Data Anda dienkripsi, diamankan, dan dikendalikan "
                                            "untuk diakses oleh standar "
                                            "yang berlaku dan merujuk pada ",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 12)
                                    ),
                                    TextSpan(
                                      text: 'Syarat dan Ketentuan',
                                      style: new TextStyle(
                                          color: Colors.blue[900],
                                          decoration: TextDecoration.underline,
                                          fontSize: 13),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          print('LINK');
                                        },
                                    ),
                                    TextSpan(
                                        text: " dan ",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 12)
                                    ),
                                    TextSpan(
                                      text: 'Kebijakan Privasi',
                                      style: new TextStyle(
                                          color: Colors.blue[900],
                                          decoration: TextDecoration.underline,
                                          fontSize: 13),
                                      recognizer: new TapGestureRecognizer()
                                        ..onTap = () {
                                          print('LINK');
                                        },
                                    ),
                                  ]
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: RaisedButton(
                              textColor: Colors.yellowAccent,
                              padding: EdgeInsets.all(15),
                              color: Colors.blue[900],
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
    );
  }
}
