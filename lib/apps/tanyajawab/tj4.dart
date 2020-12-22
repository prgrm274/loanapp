import 'package:flutter/material.dart';

class TanyaJawab4 extends StatefulWidget {
  TanyaJawab4({Key key}) : super(key: key);

  @override
  _TanyaJawab4State createState() => _TanyaJawab4State();
}

class _TanyaJawab4State extends State<TanyaJawab4> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Apa produk Danafix?'),
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
                        'Dokumen apa saja yang perlu disiapkan?',
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
                            '- Anda hanya siapkan:\n'
                            '- nomor KTP,\n'
                            '- kontak saudara tidak serumah,\n'
                            '- Kontak kantor tempat Anda bekerja\n'
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