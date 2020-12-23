import 'package:flutter/material.dart';

class TanyaJawab8 extends StatefulWidget {
  TanyaJawab8({Key key}) : super(key: key);

  @override
  _TanyaJawab8State createState() => _TanyaJawab8State();
}

class _TanyaJawab8State extends State<TanyaJawab8> {
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
                        'Kapan saya menerima pinjaman tersebut?',
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
                        '- Pinjaman anda akan ditransfer setelah melalui proses verifikasi.\n'
                            '- Dana akan segera anda terima dalam waktu tiga menit setelah pinjaman '
                            'disetujui.'
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