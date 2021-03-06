import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionRequest2 extends StatefulWidget {
  PermissionRequest2({Key key}) : super(key: key);

  @override
  _PermissionRequest2State createState() => _PermissionRequest2State();
}

class _PermissionRequest2State extends State<PermissionRequest2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// like style in android
      theme: ThemeData(
        fontFamily: "Lucida Sans",
        buttonColor: Colors.blue[900],
      ),
      home: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,

        /// 'BARIS' UTAMA
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            /// layout atas dan tengah
            Container(
              height: 400,
              child: ListView(children: <Widget>[
                /// 'BARIS' SELAMAT DATANG
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 7),
                  tileColor: Colors.lightBlueAccent[200],
                  title: Text('Selamat datang di danafix',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  color: Colors.lightBlueAccent[200],
                  child: Text(
                    'Izinkan kami menggunakan beberapa informasi pribadi dan non-pribadi '
                        'Anda untuk memproses aplikasi Anda dan menyediakan layanan kami',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                        child: Icon(Icons.call),
                      ),
                      Expanded(
                        child: Container(
                          /// IF ALL COMPONENTS ARE DONE AND THE LAYOUT CHANGED, TRY CHANGE THE 42
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
                                    'Kami mencatat dan menggunakan informasi ponsel Anda, seperti IMEI, informasi perangkat lunak, dll. '
                                        'Untuk mendapatkan data statistik dan menganalisis pengiriman layanan Aplikasi dan untuk '
                                        'meningkatkan kinerja aplikasi di wilayah Anda',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                ])),
                      )
                    ]),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
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
                                    'Kami mencatat dan menggunakan posisi Anda untuk meningkatkan kinerja aplikasi di wilayah Anda',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                ])),
                      )
                    ]),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
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
                                    'Kami menggunakan kamera Anda untuk mengambil foto Anda dan mengunggahnya ke aplikasi Anda',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                ])),
                      )
                    ]),
                  ),
                ]),

                /// 'baris' bawah
                /*Row(
            children: <Widget>[
              Text('data'),
              Spacer(),
              Text('data'),
            ]
          )*/
              ]),
            ),

            /// layout terima
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
              height: 200,
              child: ListView(children: <Widget>[
                Container(
                  height: 200,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.center,
                        child: Text(
                          "Analisis informasi atas data yang dikumpulkan di atas dilakukan secara otomatis. "
                              "Data Anda dienkripsi, diamankan, dan dikendalikan untuk diakses oleh standar "
                              "yang berlaku dan merujuk pada",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                          width: 400,
                          bottom: 10,
                          child: RaisedButton(
                            color: Theme.of(context).buttonColor,
                            onPressed: () {},
                            child: Text(
                              'TERIMA',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
