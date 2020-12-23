import 'package:flutter/material.dart';

class TanyaJawab7 extends StatefulWidget {
  TanyaJawab7({Key key}) : super(key: key);

  @override
  _TanyaJawab7State createState() => _TanyaJawab7State();
}

class _TanyaJawab7State extends State<TanyaJawab7> {
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
                        'Apa yang harus saya lakukan jika belum menerima SMS konfirmasi dari DanaFix?',
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
                        '- Harap hubungi kami -> http://danafix.id/contact-us'
                            '- Hotline: 14086'
                            '- E-mail: info@danafix.id'
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