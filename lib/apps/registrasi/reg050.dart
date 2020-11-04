import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';

class Reg050 extends StatefulWidget {
  Reg050({Key key}) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
              padding: EdgeInsets.all(15),
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
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
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
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text(
                      'Jenis kelamin',
                      style: TextStyle(color: Colors.grey[600], fontSize: 18),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
                      Column(children: <Widget>[
                        Radio(
                          mouseCursor: MouseCursor.defer,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          activeColor: Colors.grey[600],
                          value: Pendidikan.Sekolah_Dasar,
                          groupValue: _pendidikan,
                          onChanged: (Pendidikan value) {
                            setState(() {
                              _pendidikan = value;
                            });
                          },
                        ),
                      ]),
                      Column(children: <Widget>[
                        Text('Laki-laki',
                          style: TextStyle(color: Colors.grey[400], fontSize: 18),),
                      ]),
                      Column(children: <Widget>[
                        Radio(
                          activeColor: Colors.grey[600],
                          value: Pendidikan.Sekolah_Dasar,
                          groupValue: _pendidikan,
                          onChanged: (Pendidikan value) {
                            setState(() {
                              _pendidikan = value;
                            });
                          },
                        ),
                      ]),
                      Column(children: <Widget>[
                        Text('Perempuan',
                          style: TextStyle(color: Colors.grey[400], fontSize: 18),),
                      ]),
                    ]),
                  ),
                ],
                mainAxisSize: MainAxisSize.max,),


                /// LABEL DAN DROPDOWN JUMLAH ANAK
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
                    child: Text(
                      'Jumlah anak',
                      style: TextStyle(
                        color: Colors.cyan[600],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Dropdown1JmlAnak(

                        ),
                      )
                    ])
                  )
                ]),

                /// LABEL DAN DROPDOWN PENDIDIKAN TERAKHIR
                Row(children: <Widget>[
                  Container(
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: Text(
                      'Pendidikan terakhir',
                      style: TextStyle(
                        color: Colors.cyan[600],
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Row(children: <Widget>[
                      Expanded(
                        child: Dropdown1(

                        ),
                      )
                    ])
                  )
                ]),

                /// LABEL DAN EMAIL
                Row(children: <Widget>[
                  Container(
                    // margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.cyan[600],
                        fontWeight: FontWeight.bold
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
              ]),
            ),
          )
        ])
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