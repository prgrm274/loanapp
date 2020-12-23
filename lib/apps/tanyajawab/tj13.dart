import 'package:flutter/material.dart';

class TanyaJawab13 extends StatefulWidget {
  TanyaJawab13({Key key}) : super(key: key);

  @override
  _TanyaJawab13State createState() =>
      _TanyaJawab13State();
}

class _TanyaJawab13State extends State<TanyaJawab13> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Pertanyaan'),
          titleSpacing: 10.0,
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
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Apakah mungkin melakukan pembayaran pinjaman yang telah melewati jatuh '
                            'dikontrak pinjaman?',
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
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Harap melakukan pembayaran pinjaman sesuai dengan jatuh tempo Kontrak'
                            'Pinjaman. Untuk keterlambatan pembayaran pinjaman akan dikenakan biaya seperti'
                            'yang tercantum di Kontrak Pinjaman.'
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}