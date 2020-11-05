import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar050.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';
import 'package:voidrealm/validations/date_input_text_field.dart';
import 'package:voidrealm/validations/date_validator.dart';

class Reg050 extends StatefulWidget {
  Reg050({Key key}) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  TextEditingController _textController = TextEditingController();

  bool tampilkanText = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        tampilkanText = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
      home: SingleChildScrollView(
        // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            color: Colors.white,
            // height: MediaQuery.of(context).size.height * 1,
            child: Column(children: <Widget>[
              /// APPBAR
              // Appbar050(),

              /// BAWAH APPBAR
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                color: Colors.grey[100],
                child: Row(children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Saya terima\nRp 1.500.000',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: Image(
                              image: AssetImage('lib/assets/info_48.png',),
                              width: 12,
                              height: 12,
                            ),
                            onTap: (){
                              print('onTap info nilai angsuran');
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                child: Text(
                                  'Nilai angsuran',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.cyan,
                                    fontSize: 12
                                  ),
                                ),
                                onTap: (){
                                  print('onTap nilai angsuran');
                                },
                              ),
                              Text(
                                'Rp 525.000',
                                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                              ),
                            ]
                          )
                        ]
                      ),
                    )
                  ),
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Bayar pertama\n27.10.2020',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                ],
                  mainAxisSize: MainAxisSize.max,
                  /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),

              /// LABEL DAN NAMA KTP EDIT
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                alignment: Alignment.topLeft,
                child: Text(
                  'Nama lengkap sesuai KTP',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tanggal lahir',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
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

              /// LABEL DAN TANGGAL EDIT DGN PENGESAHAN PENATAAN
              tampilkanText ? Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tanggal lahir dgn pengesahan',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]) : Container(),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle),
                    // child: DateInputTextField(),/// WITH IMPORT
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          errorText: DateHelper.isValidDateBirth(
                              _textController.text.toString(), 'dd/MM/yyyy') ?
                              // (){_changed(true, "tag");}///ng
                              null
                              :  'Masukkan data dengan benar',
                          errorStyle: TextStyle(
                              color: Colors.redAccent,
                              backgroundColor: Colors.redAccent
                          )
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [DateTextFormatter()],
                      onChanged: (String value) {
                        if (DateHelper.isValidDateBirth(value, 'dd/MM/yyyy')) {
                          _changed(false, "tag");
                          print('True');
                        } else {
                          _changed(true, "tag");
                          print('False');
                        }
                        setState(() {
                          // _changed(false, "tag");
                        });
                      },
                      // onChanged: (String value) {},
                    ),
                  ),
                ),
              ]),

              /// LABEL DAN TEMPAT LAHIR EDIT
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tempat lahir',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.yellowAccent,
                        focusColor: Colors.yellowAccent,
                        hintText: 'Masukkan tempat lahir',
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
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jenis kelamin',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15
                    ),
                  ),
                ),
              ]),
              /// RADIOS
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Radio(
                              toggleable: true,
                              mouseCursor: MouseCursor.defer,
                              materialTapTargetSize: MaterialTapTargetSize.padded,
                              activeColor: Colors.grey[600],
                              value: Pendidikan.Sekolah_Dasar,
                              groupValue: _pendidikan,
                              onChanged: (Pendidikan value) {
                                setState(() {
                                  _pendidikan = value;
                                });
                              },
                            ),
                            Text(
                              'Laki-laki',
                              style: TextStyle(color: Colors.grey[400], fontSize: 13),
                            ),
                          ]
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Radio(
                            toggleable: true,
                            mouseCursor: MouseCursor.defer,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            activeColor: Colors.grey[600],
                            value: Pendidikan.Sekolah_Dasar,
                            groupValue: _pendidikan,
                            onChanged: (Pendidikan value) {
                              setState(() {
                                _pendidikan = value;
                              });
                            },
                          ),
                          Text(
                            'Perempuan',
                            style: TextStyle(color: Colors.grey[400], fontSize: 13),
                          ),
                        ]
                    ),
                  ],
                ),
              ),

              /// LABEL DAN DROPDOWN JUMLAH ANAK
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jumlah anak',
                    style: TextStyle(
                        color: Colors.cyan[600],
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Dropdown1JmlAnak(),
                      ),
                    ]))
              ]),

              /// LABEL DAN EMAIL
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nama ibu kandung',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nama ibu kandung',
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

              /// LABEL DAN DROPDOWN PENDIDIKAN TERAKHIR
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Pendidikan terakhir',
                    style: TextStyle(
                        color: Colors.cyan[600],
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Dropdown1(),
                      )
                    ]))
              ]),

              /// LABEL DAN EMAIL
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'E-mail',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan email aktif Anda dengan benar',
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
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 40, 15, 20),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                    onPressed: (){},
                    textColor: Colors.white,
                    color: Colors.cyan,
                    child: Text('Berikutnya'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        side: BorderSide(color: Colors.cyan)
                    ),
                  ),
                ),
              )
            ]),
        ),
      )
    );
  }

  Pendidikan _pendidikan = Pendidikan.Sekolah_Dasar;
}

enum Pendidikan {
  Sekolah_Dasar,
  Sekolah_Menengah_Pertama,
  Sekolah_Menengah_Atas,
  Kuliah
}
