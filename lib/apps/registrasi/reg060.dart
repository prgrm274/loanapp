import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar050.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_agama.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_lamatinggal.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_propinsi.dart';
import 'package:voidrealm/regexes/alphanumeric.dart';
import 'package:voidrealm/validations/date_input_text_field.dart';
import 'package:voidrealm/validations/date_validator.dart';

class Reg060 extends StatefulWidget {
  Reg060({Key key}) : super(key: key);

  @override
  _Reg060State createState() => _Reg060State();
}

class _Reg060State extends State<Reg060> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _textControllerNama = TextEditingController();

  bool tampilkanText = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        tampilkanText = visibility;
      }
    });
  }

  bool isNamaCorrect = false;
  bool isNamaEmpty = false;

  /// VARIABEL UNTUK KONDISI TEXT FIELD
  final boxDecorationNamaBenar = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[200],
      shape: BoxShape.rectangle);
  final boxDecorationNamaBenarButEmpty = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.yellow[200],
      shape: BoxShape.rectangle);
  final boxDecorationNamaSalah = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red[200],
      shape: BoxShape.rectangle);

  void _cekNama(bool benar, String text) {
    setState(() {
      if (Regex1.checkAlphabet(text)){
        isNamaCorrect = benar;
      }
    });
  }

  bool _cekNamaIfEmpty(String text) {
    setState(() {
      Regex1.checkAlphabet(text);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans'
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              /// SPASI ANTARA LOGO INFO DAN NILAI ANGSURAN
                              Container(width: 10,),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GestureDetector(
                                      child: Text(
                                        'Nilai angsuran',
                                        style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            color: Colors.cyan,
                                            fontSize: 12,
                                            fontFamily: 'Sans'
                                        ),
                                      ),
                                      onTap: (){
                                        print('onTap nilai angsuran');
                                      },
                                    ),
                                    Text(
                                      'Rp 525.000',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 12,
                                          fontFamily: 'Sans'
                                      ),
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
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans'
                      ),
                    ),
                  ),
                ],
                  mainAxisSize: MainAxisSize.max,
                  /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),

              /// LABEL DAN DROPDOWN JUMLAH ANAK
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Propinsi',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: DropdownPropinsi(),
                      ),
                    ]))
              ]),

              /// LABEL DAN DROPDOWN KOTA / KEC / LURAH
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Kota / Kecamatan / Kelurahan',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: DropdownPropinsi(),
                      ),
                    ]))
              ]),

              /// LABEL DAN TEXTFIELD ALAMAT LENGKAP
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Alamat lengkap (nama jalan/nomor rumah)',
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
                        hintText: 'Silahkan isi alamatnya',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        suffixIcon: IconButton(
                          // onPressed: () => tecHape.clear(),
                          icon: Icon(Icons.clear),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),

              /// LABEL DAN DROPDOWN LAMA TINGGAL
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Lama tinggal',
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
                        child: DropdownLamatinggal(),
                      )
                    ]))
              ]),

              /// LABEL DAN DROPDOWN LAMA TINGGAL
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Agama',
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
                        child: DropdownAgama(),
                      )
                    ]))
              ]),

              /// BUTTON BERIKUTNYA
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
