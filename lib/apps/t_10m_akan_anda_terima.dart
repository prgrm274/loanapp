import 'package:flutter/material.dart';

class T10MAkanAndaTerima extends StatefulWidget {
  T10MAkanAndaTerima({Key key}) : super(key: key);

  @override
  _T10MAkanAndaTerimaState createState() =>
      _T10MAkanAndaTerimaState();
}

class _T10MAkanAndaTerimaState extends State<T10MAkanAndaTerima> {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4)),
            ),
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          'Rp. 10.000.000 akan tersedia untuk Anda setelah Anda mendaftar dan membayar pinjaman pertama',
                          style: TextStyle(
                              color: Colors.blue[900], fontFamily: 'Sans'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                ]
            ),
          ),
        ]),
      ],
    );
  }
}