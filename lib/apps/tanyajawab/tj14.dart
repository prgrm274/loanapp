import 'package:flutter/material.dart';

class TanyaJawab14 extends StatefulWidget {
  TanyaJawab14({Key key}) : super(key: key);

  @override
  _TanyaJawab14State createState() =>
      _TanyaJawab14State();
}

class _TanyaJawab14State extends State<TanyaJawab14> {
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
                        'Saya telah melakukan pembayaran pinjaman namun perusahaan tidak menerimanya. '
                            'Apa yang harus saya lakukan?',
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
                        'Mohon hubungi Call Center di (underline blue clickable 14086) atau kirim email dengan melampirkan tanda terima'
                            'pembayaran ke'
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