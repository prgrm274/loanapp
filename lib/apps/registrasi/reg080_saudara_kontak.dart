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
          appBar: AppBar(
              backgroundColor: Colors.white,
              //automaticallyImplyLeading: true
              elevation: 0.0, // for elevation
              titleSpacing: 0.0,
              // if you want remove title spacing with back button
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${0.round()}% terisi\n',
                        // Text('$_value terisi, total = $_valueTotal\n',
                        // '$$progress terisi $_progres\n',
                        // '$_progres terisi\n',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    LinearProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      value: 0 * .1,
                      // value: _value * .1,
                      // value: progress,
                      // value: _progres,
                    ),
                  ]),
              // title: new SfulLinearprogressindicator(),
              // title: new ProgressIndicator1(),
              // title: Text('Custom Appbar'),
              // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
              actions: <Widget>[
                new Container(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                    child: Image(
                        image: AssetImage('lib/assets/chat_bubble_cyan.png'))
                  // child: Icon(Icons.message)
                ),
                // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
              ],
              //Action icon search as search icon, notification icon
              leading: new Material(
                /// BACK NAVIGATION ICON
                /// Custom leading icon, such as back navigation icon or other
                /// warna kotaknya navigation icon
                color: Colors.white,
                child: new InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    // Navigator.pop(context);// 2020
                  },
                  splashColor: Colors.red,
                  // splashColor: UniQueryColors.colorGradientEnd.withOpacity(.5),
                  child: new Container(/// kotaknya navigation icon
                    // color: Colors.red,
                      padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                      child: Image(
                          image: AssetImage('lib/assets/grey_arrow_white.png'))
                    // child: Icon(Icons.arrow_back_rounded)
                    // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
                  ),
                ),
              )
          ),
          // appBar: AppbarProgress(),
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
