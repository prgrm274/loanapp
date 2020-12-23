import 'package:flutter/material.dart';

class TanyaJawab12 extends StatefulWidget {
  TanyaJawab12({Key key}) : super(key: key);

  @override
  _TanyaJawab12State createState() =>
      _TanyaJawab12State();
}

class _TanyaJawab12State extends State<TanyaJawab12> {
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
                        'Apakah mungkin melakukan pelunasan lebih awal?',
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
                        'Anda bisa melakukan pelunasan lebih awal setelah minimal setengah '
                            'dari periode kontrak, namun tidak diperkenankan jika pinjaman '
                            'belum melewati 7 hari kalender'
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