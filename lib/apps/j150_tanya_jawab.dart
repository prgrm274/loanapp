import 'package:flutter/material.dart';

class J150TanyaJawab extends StatefulWidget {
  J150TanyaJawab({Key key}) : super(key: key);

  @override
  _J150TanyaJawabState createState() => _J150TanyaJawabState();
}

class _J150TanyaJawabState extends State<J150TanyaJawab> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints viewportConstraints) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              titleSpacing: 10.0,
              backgroundColor: Colors.cyan,
              title: Text('Tanya jawab'),
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                splashColor: Colors.red,
                child: new Container(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                    child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white
                    )
                ),
              ),
            ),
            body: Container(
              child: LayoutBuilder(
                builder: (BuildContext ctx, BoxConstraints constraints) {
                  /// ListView BISA MENYEDIAKAN SCROLL
                  /// TANPA PAKE SingleChildScrollView
                  return ListView(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                            'PERNYATAAN PENYANGKALAN (DISCLAIMER)',
                            style: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('PERNYATAAN PENYANGKALAN (DISCLAIMER)'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(''),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Apa produk DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                            'Mengenai pinjaman',
                            style: TextStyle(color: Colors.grey[400])
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Siapa yang dapat menggunakan layanan pinjaman DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Dokumen apa saja yang perlu disiapkan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Bagaimana mengetahui jika saya telah menerima pencairan tersebut?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Di kota mana layanan pinjaman DanaFix bisa dilakukan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Apa yang harus saya lakukan jika belum menerima SMS konfirmasi dari DanaFix?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          'Mengenai menerima uang',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Kapan saya menerima pinjaman tersebut?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Dimana saya dapat menerima pencairan?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                          color: Colors.grey[300],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          'Mengenai pembayaran pinjaman',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Kapan saya harus melakukan pembayaran pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Bagaimana melakukan pembayaran pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Apakah mungkin melakukan pelunasan lebih awal?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Apakah mungkin melakukan pembayaran pinjaman yang telah melewati jatuh tempo dikontrak pinjaman?'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1, color: Colors.grey[400]
                              )
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text('Saya telah melakukan pembayaran pinjaman namun perusahaan tidak menerimanya. Apa yang harus saya lakukan?'),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}