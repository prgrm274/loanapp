import 'package:flutter/material.dart';

class TanyaJawab3 extends StatefulWidget {
  TanyaJawab3({Key key}) : super(key: key);

  @override
  _TanyaJawab3State createState() =>
      _TanyaJawab3State();
}

class _TanyaJawab3State extends State<TanyaJawab3> {
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
                        'Siapa yang dapat menggunakan layanan pinjaman DanaFix?',
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
                        '- Nasabah dengan umur 22 tahun - 60 tahun\n'
                            '- Minimal penghasilan perbulan Rp (clickable contact number 2.000.000),-\n'
                            '- Bertempat tinggal dan bekerja di Indonesia'
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