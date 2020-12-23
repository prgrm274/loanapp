import 'package:flutter/material.dart';

class TanyaJawab11 extends StatefulWidget {
  TanyaJawab11({Key key}) : super(key: key);

  @override
  _TanyaJawab11State createState() =>
      _TanyaJawab11State();
}

class _TanyaJawab11State extends State<TanyaJawab11> {
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
                        'Bagaimana melakukan pembayaran pinjaman?',
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
                        '- Pembayaran pinjaman melalui transfer ke:\n'
                            '- Nama Bank: CIMB Niaga\n'
                            '- Atas nama: Nama nasabah masing-masing\n'
                            '- Nomor rekening: Gunakan nomor rekening yang dikirim ke SMS Anda'
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