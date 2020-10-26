import 'dart:ui';

import 'package:flutter/material.dart';

class PermissionRequest extends StatefulWidget {
  PermissionRequest({Key key}) : super(key: key);

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      /// 'BARIS' UTAMA
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
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
          Row()
        ],
      ),

    );
  }
}
