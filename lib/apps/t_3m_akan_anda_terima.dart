import 'package:flutter/material.dart';

class T3MAkanAndaTerima extends StatefulWidget {
  T3MAkanAndaTerima({Key key}) : super(key: key);

  @override
  _T3MAkanAndaTerimaState createState() => _T3MAkanAndaTerimaState();
}

class _T3MAkanAndaTerimaState extends State<T3MAkanAndaTerima> {
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
                          'Rp. 3.000.000 akan tersedia untuk Anda setelah Anda mendaftar dan membayar pinjaman pertama',
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
