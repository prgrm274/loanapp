import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/apps/registrasi/reg080_button.dart';
import 'package:voidrealm/apps/registrasi/reg_under_appbar.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown_kontakdarurat_080.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_agama.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_bidangindustri.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_lamabekerja.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_lamatinggal.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_pekerjaan.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_propinsi.dart';
import 'package:voidrealm/regexes/alphanumeric.dart';
import 'package:voidrealm/validations/date_input_text_field.dart';
import 'package:voidrealm/validations/date_validator.dart';

class Reg080 extends StatefulWidget {
  Reg080({Key key}) : super(key: key);

  @override
  _Reg080State createState() => _Reg080State();
}

class _Reg080State extends State<Reg080> {
  TextEditingController _textControllerNamaSaudara = TextEditingController();
  TextEditingController _textControllerKontakDarurat = TextEditingController();

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Scaffold(
          appBar: AppbarProgress(),
          body: SingleChildScrollView(/// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
            // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              color: Colors.white,
              // height: MediaQuery.of(context).size.height * 1,
              child: Column(children: <Widget>[
                /// NYOBA APPBAR DITARUH DI BODY HH
                // Appbar050(),

                /// BAWAH APPBAR
                RegUnderAppbar(),

                /// LABEL DAN TEXTFIELD NAMA LENGKAP SAUDARA
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nama lengkap saudara - minimal 2 kata',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans'
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: TextField(
                        controller: _textControllerNamaSaudara,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Ketik nama lengkap saudara',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            onPressed: () => _textControllerNamaSaudara.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                /// LABEL DAN TEXTFIELD NOMOR KONTAK DARURAT
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nomor kontak darurat',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans'
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: TextField(
                        controller: _textControllerKontakDarurat,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: 'Masukan nomor HP saudara',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            onPressed: () => _textControllerKontakDarurat.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                /// LABEL Ketik informasi nomor Telepon
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '*Ketik informasi nomor Telepon yang Aktif untuk proses Persetujuan pinjaman',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                            fontFamily: 'Sans'
                        ),
                      ),
                    ),
                  )
                ]),

                /// LABEL DAN DROPDOWN HUBUNGAN DENGAN KONTAK DARURAT
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hubungan dengan kontak darurat',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontFamily: 'Sans'
                      ),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                        Expanded(
                          child: DropdownKontakDarurat(),
                        ),
                      ]))
                ]),

                /// BUTTON BERIKUTNYA
                Reg080Button()
              ]),
            ),
          ),
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
