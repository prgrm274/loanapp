import 'package:flutter/material.dart';

/// BEDA DGN LAIN, INI PAKE ROW spaceEvenly
class Reg050UnderAppbar extends StatefulWidget {
  Reg050UnderAppbar({Key key}) : super(key: key);

  @override
  _Reg050UnderAppbarState createState() => _Reg050UnderAppbarState();
}

class _Reg050UnderAppbarState extends State<Reg050UnderAppbar> {
  @override
  Widget build(BuildContext context) {
    /// UNDER APPBAR
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: Colors.grey[100],
      child: Row(
        ///
        mainAxisSize: MainAxisSize.max,
        /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[
          Flexible(
            flex: 1,
            child: Text(
              'Saya terima\nRp 1.500.000',
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontFamily: 'Sans'),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Row(children: <Widget>[
                  GestureDetector(
                    child: Image(
                      image: AssetImage(
                        'lib/assets/info_48.png',
                      ),
                      width: 12,
                      height: 12,
                    ),
                    onTap: () {
                      print('onTap info nilai angsuran');
                    },
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            'Nilai angsuran',
                            style: TextStyle(
                                decoration:
                                TextDecoration.underline,
                                color: Colors.cyan,
                                fontSize: 12,
                                fontFamily: 'Sans'),
                          ),
                          onTap: () {
                            print('onTap nilai angsuran');
                          },
                        ),
                        Text(
                          'Rp 525.000',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontFamily: 'Sans'),
                        ),
                      ]
                  )
                ],
                  ///spaceEvenly
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  /// CENTER MEREKATKAN ICON INFO DAN NILAI ANGSURAN
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              )
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Bayar pertama\n27.10.2020',
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontFamily: 'Sans'),
            ),
          ),
        ],
      ),
    );
  }
}