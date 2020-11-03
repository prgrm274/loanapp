import 'package:flutter/material.dart';

class Reg050 extends StatefulWidget {
  Reg050({Key key}) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // height: MediaQuery.of(context).size.height * 1,
        child: Column(children: <Widget>[
          /// BAWAH APPBAR
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Colors.grey[100],
            child: Row(children: <Widget>[
              Expanded(
                child: Text(
                  'Saya terima\nRp 1.500.000',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Nilai angsuran\nRp 525.000',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Bayar pertama\n27.10.2020',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ]),
          ),

          /// LABEL DAN NAMA KTP EDIT
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 15),
                    child: Text(
                      'Nama lengkap sesuai KTP',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Dian Permata Fransiska',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            // onPressed: () => tecHape.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                /// LABEL DAN TANGGAL EDIT
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: Text(
                      'Tanggal lahir',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '24.05.1986',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            // onPressed: () => tecHape.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                /// LABEL DAN RADIO JENIS KELAMIN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: Text(
                      'Jenis kelamin',
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Column(children: <Widget>[
                    Text('simple text'),
                  ]),
                  Column(children: <Widget>[
                    Text('simple text'),
                  ]),
                  Column(children: <Widget>[
                    Text('simple text'),
                  ]),
                  Column(children: <Widget>[
                    Text('simple text'),
                  ]),
                ])
              ]),
            ),
          )
        ]));
  }
}
