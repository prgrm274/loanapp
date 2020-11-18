import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PermissionRequest extends StatefulWidget {
  PermissionRequest({Key key}) : super(key: key);

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Container(
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
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 2),
                    tileColor: Colors.cyan[400],
                    title: Text('Selamat datang di danafix',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 22)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    color: Colors.cyan[400],
                    child: Text(
                      'Izinkan kami menggunakan beberapa informasi pribadi dan non-pribadi '
                          'Anda untuk memproses aplikasi Anda dan menyediakan layanan kami',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.yellow[50], fontSize: 12),
                    ),
                  ),

                  Row(
                      children: <Widget>[
                        Container(
                          height: 60,
                        ),
                        Spacer(),
                      ]
                  ),

                  /// INFORMASI TELEPON
                  Row(children: <Widget>[
                    Expanded(
                      child: Row(children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                          child: Icon(Icons.call),
                        ),
                        Expanded(
                          child: Container(
                            /// IF ALL COMPONENTS ARE DONE AND THE LAYOUT CHANGED,
                            /// TRY CHANGE THE 42
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
                                          color: Colors.grey[600], fontSize: 12),
                                    ),
                                  ]
                              )
                          ),
                        )
                      ]),
                    ),
                  ]),

                  /// POSISI GEOGRAFIS
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
                                      'Kami mencatat dan menggunakan posisi Anda '
                                          'untuk meningkatkan kinerja aplikasi di wilayah Anda',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          color: Colors.grey[600], fontSize: 12),
                                    ),
                                  ])),
                        )
                      ]),
                    ),
                  ]),

                  /// KAMERA
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
                                      'Kami menggunakan kamera Anda untuk mengambil '
                                          'foto Anda dan mengunggahnya ke aplikasi Anda',
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
                margin: EdgeInsets.fromLTRB(10, 100, 10, 0),
                height: 150,
                child: ListView(children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Divider(
                                    color: Colors.grey
                                ),
                              )
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 5),
                          child: Text(
                            "Analisis informasi atas data yang dikumpulkan di atas "
                                "dilakukan secara otomatis. "
                                "Data Anda dienkripsi, diamankan, dan dikendalikan "
                                "untuk diakses oleh standar "
                                "yang berlaku dan merujuk pada Syarat dan Ketentuan "
                                "dan Kebijakan Privasi",
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(0, 95, 0, 5),
                          child: RaisedButton(
                            textColor: Colors.yellowAccent,
                            padding: EdgeInsets.all(15),
                            color: Colors.blue[800],
                            // color: Theme.of(context).backgroundColor,
                            onPressed: () {},
                            child: Text(
                              'TERIMA',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          ),
                        ),

                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
