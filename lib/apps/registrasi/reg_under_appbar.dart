import 'package:flutter/material.dart';

class RegUnderAppbar extends StatefulWidget {
  RegUnderAppbar({Key key}) : super(key: key);

  @override
  _RegUnderAppbarState createState() => _RegUnderAppbarState();
}

class _RegUnderAppbarState extends State<RegUnderAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      color: Colors.grey[100],
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Text(
              'Saya terima\nRp 1.500.000',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
            ),
          ),
          Flexible(
              flex: 1,
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Image(
                          image: AssetImage('lib/assets/info_48.png'),
                          width: 12,
                          height: 12,
                        ),
                        onTap: () {
                          print('onTap info nilai angsuran');
                        },
                      ),

                      /// SPASI ANTARA LOGO INFO DAN NILAI ANGSURAN
                      Container(width: 10),

                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Nilai angsuran',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
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
                                  fontFamily: 'Sans')
                            ),
                          ]
                      )
                    ]
                ),
              )
          ),
          Flexible(
            flex: 1,
            child: Text(
              'Bayar pertama\n27.10.2020',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.max,

        /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
