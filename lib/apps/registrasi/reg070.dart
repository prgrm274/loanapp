import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/apps/registrasi/reg070_button.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
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

class Reg070 extends StatefulWidget {
  Reg070({Key key}) : super(key: key);

  @override
  _Reg070State createState() => _Reg070State();
}

class _Reg070State extends State<Reg070> {
  TextEditingController _tECNamaPerusahaan = TextEditingController();
  TextEditingController _tECPosisiPerusahaan = TextEditingController();

  bool tampilkanText = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        tampilkanText = visibility;
      }
    });
  }

  bool isNamaPerusahaanFokus = false;
  bool isNamaPerusahaanCorrect = false;
  bool isPosisiPerusahaanFokus = false;
  bool isPosisiPerusahaanCorrect = false;

  /// VARIABEL UNTUK KONDISI TEXT FIELD
  final boxDecorationPerusahaanBenar = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[200],
      shape: BoxShape.rectangle);
  final boxDecorationPerusahaanSalah = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red[200],
      shape: BoxShape.rectangle);
  final boxDecorationPerusahaanJustOnFocus = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey[800].withOpacity(0.5),
          spreadRadius: 0.2,

          /// SEBERAPA JAUH PENDARAN SHADOW
          // spreadRadius: 5,
          blurRadius: 7,

          /// DX PENDAR KE SAMPING, DY PENDAR KE BAWAH
          /// changes position of shadow
          offset: Offset(0, 1),
          // offset: Offset(0, 3),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      shape: BoxShape.rectangle);
  final boxDecorationDefault = BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.grey[200], shape: BoxShape.rectangle);
  void _cekNama(bool benar, String text) {
    setState(() {
      if (Regex1.checkAlphabet(text)) {
        isNamaPerusahaanCorrect = benar;
      }
    });
  }

  bool _cekNamaIfEmpty(String text) {
    setState(() {
      Regex1.checkAlphabet(text);
    });
  }

  double progress = 0;

  @override
  void initState() {
    setState(() {
      if (isNamaPerusahaanCorrect) {
        progress += 1;
      } else {
        if (progress > 0) {
          progress -= 5;
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(/// BERI MATERIAL AGAR TEXTFIELD TIDAK MUNCUL KUNING

        child: Scaffold(
          /// SEMENTARA APPBAR JADI SATU (NGGA IMPORT) UNTUK NGETES VALUE TERISI LANGSUNG DISINI
          appBar: AppBar(
              backgroundColor: Colors.white,
              //automaticallyImplyLeading: true
              elevation: 0.0,
              // for elevation
              titleSpacing: 0.0,
              // if you want remove title spacing with back button
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${progress.round()}% terisi\n',
                      // '$_progres terisi\n',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    LinearProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      value: progress,
                      // value: _progres,
                    )
                  ]),
              // title: new SfulLinearprogressindicator(),
              // title: new ProgressIndicator1(),
              // title: Text('Custom Appbar'),
              // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
              actions: <Widget>[
                new Container(
                    padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                    child: Image(
                      image: AssetImage('lib/assets/chat_bubble_cyan.png'),
                    )
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
              )),
          // appBar: AppbarProgress(),
          body: SingleChildScrollView(/// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
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
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Saya terima\nRp 1.500.000',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontFamily: 'Sans'))),
                      Flexible(
                          flex: 1,
                          child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Image(
                                      image: AssetImage(
                                        'lib/assets/info_48.png'),
                                      width: 12,
                                      height: 12,
                                    ),
                                    onTap: () {
                                      print('onTap info nilai angsuran');
                                    },
                                  ),

                                  /// SPASI ANTARA LOGO INFO DAN NILAI ANGSURAN
                                  Container(width: 10),

                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        GestureDetector(
                                          child: Text(
                                            'Nilai angsuran',
                                            style: TextStyle(
                                                decoration:
                                                TextDecoration.underline,
                                                color: Colors.cyan,
                                                fontSize: 12,
                                                fontFamily: 'Sans'),
                                          ),
                                          onTap: () {
                                            print('onTap nilai angsuran');
                                          },
                                        ),
                                        Text(
                                          'Rp 525.000',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 12,
                                              fontFamily: 'Sans')),
                                      ])
                                ]),
                          )
                      ),

                      Flexible(
                        flex: 1,
                        child: Text(
                          'Bayar pertama\n27.10.2020',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                              fontFamily: 'Sans'),
                        ),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.max,

                    /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),

                /// LABEL DAN DROPDOWN PEKERJAAN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pekerjaan',
                      style: TextStyle(color: Colors.cyan, fontSize: 12)),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                        Expanded(
                          child: DropdownPekerjaan(),
                        ),
                      ]))
                ]),

                /// LABEL DAN DROPDOWN BIDANG INDUSTRI
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Bidang industri',
                      style: TextStyle(color: Colors.cyan, fontSize: 12),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                        Expanded(
                          child: DropdownBidangindustri(),
                        ),
                      ]))
                ]),

                /// LABEL NAMA PERUSAHAAN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nama perusahaan',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ]),
                /// TEXTFIELD NAMA PERUSAHAAN
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: FocusScope(
                        onFocusChange: (focus) => print("focus NAMA PERUSAHAAN: $focus"),
                        child: TextFormField(
                          controller: _tECNamaPerusahaan,
                          onChanged: (String s) {

                            setState(() {

                              if (_tECNamaPerusahaan.text.isNotEmpty) {
                                isNamaPerusahaanCorrect = true;
                                print('isNamaPerusahaanCorrect $isNamaPerusahaanCorrect');
                              }
                            });
                          },
                          cursorColor: Colors.black,
                          // keyboardType: inputType,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: 'Ketik nama perusahaan',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            suffixIcon: IconButton(
                              // onPressed: () => tecHape.clear(),
                              icon: Icon(Icons.clear),
                            ),
                            focusColor: Colors.greenAccent,
                            fillColor: Colors.green
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                /// LABEL DAN TEXTFIELD POSISI DI PERUSAHAAN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Posisi di perusahaan',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: boxDecorationDefault,
                      // isPosisiPerusahaanFokus ?
                      //     boxDecorationPerusahaanJustOnFocus :
                      // (
                      //     isPosisiPerusahaanCorrect ?
                      //     boxDecorationPerusahaanBenar :
                      //     boxDecorationPerusahaanSalah
                      // ),
                      child: FocusScope(
                        onFocusChange: (focus) {
                          isPosisiPerusahaanFokus = focus;
                          print("focus POSISI PERUSAHAAN: $focus");
                          print("isPosisiPerusahaanFokus: $isPosisiPerusahaanFokus");
                        },
                        child: TextFormField(
                          autofocus: false,
                          onTap: (){
                            // if (!isPosisiPerusahaanFokus) {
                            //   isPosisiPerusahaanFokus = true;
                            // }
                          },
                          onChanged: (String value) {
                            if (_tECPosisiPerusahaan.text.isNotEmpty) {
                              isPosisiPerusahaanCorrect = true;
                            }
                          },
                          controller: _tECPosisiPerusahaan,
                          cursorColor: Colors.black,
                          // keyboardType: inputType,
                          decoration: isPosisiPerusahaanFokus ?
                          new InputDecoration(
                              filled: true,
                              focusColor: Colors.green,
                              fillColor: Colors.deepPurple,
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.yellowAccent,
                                    width: 2,
                                    style: BorderStyle.solid))
                          ) :
                          new InputDecoration(
                            filled: false,
                            // filled: isPosisiPerusahaanFokus ? true : false,
                            // filled: isPosisiPerusahaanFokus ? true :
                            // (
                            //   isPosisiPerusahaanCorrect ?
                            //       false : false
                            // ),
                            focusColor: Colors.green,
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.yellowAccent,
                                  width: 2,
                                  style: BorderStyle.solid)),
                            // focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                            hintText: 'Ketik nama jabatan anda',
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            suffixIcon: IconButton(
                              onPressed: () => _tECPosisiPerusahaan.clear(),
                              icon: Icon(Icons.clear)),
                          ),
                        ),
                      ),

                      // child: TextField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Ketik nama jabatan anda',
                      //     hintStyle: TextStyle(color: Colors.grey[400]),
                      //     suffixIcon: IconButton(
                      //       // onPressed: () => tecHape.clear(),
                      //       icon: Icon(Icons.clear),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ]),

                /// LABEL DAN TEXTFIELD PENDAPATAN BULANAN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pendapatan bulanan',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
                      child: TextFormField(
                        cursorColor: Colors.black,
                        // keyboardType: inputType,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Ketik jumlah yang Anda terima per bulan (Rp)',
                          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                          suffixIcon: IconButton(
                            // onPressed: () => tecHape.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),

                      /// KALO HANYA TEXTFIELD, AKAN MUNCUL UNDERLINE BIRU
                      // child: TextField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Ketik jumlah yang Anda terima per bulan (Rp)',
                      //     hintStyle: TextStyle(color: Colors.grey[400]),
                      //     suffixIcon: IconButton(
                      //       // onPressed: () => tecHape.clear(),
                      //       icon: Icon(Icons.clear),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ]),

                /// LABEL DAN DROPDOWN LAMA BEKERJA
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Lama bekerja',
                      style: TextStyle(color: Colors.cyan, fontSize: 12),
                    ),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                      child: Row(children: <Widget>[
                        Expanded(
                          child: DropdownLamabekerja(),
                        )
                      ]))
                ]),

                /// LABEL DAN TEXTFIELD PENDAPATAN BULANAN
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nomor telepon perusahaan',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
                      child: TextFormField(
                        cursorColor: Colors.black,
                        // keyboardType: inputType,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: '0810 1234 4567',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                          suffixIcon: IconButton(
                            // onPressed: () => tecHape.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),

                      // child: TextField(
                      //   decoration: InputDecoration(
                      //     hintText: '0810 1234 4567',
                      //     hintStyle: TextStyle(color: Colors.grey[400]),
                      //     suffixIcon: IconButton(
                      //       // onPressed: () => tecHape.clear(),
                      //       icon: Icon(Icons.clear),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ]),

                /// LABEL DAN TEXTFIELD ALAMAT KANTOR
                Row(children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Alamat kantor',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
                      child: TextFormField(
                        cursorColor: Colors.black,
                        // keyboardType: inputType,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          // contentPadding: EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: 'Alamat kantor',
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

                /// BUTTON BERIKUTNYA
                Reg070Button()
              ]),
            ),
          ),
        )
    ));
  }

  Pendidikan _pendidikan = Pendidikan.Sekolah_Dasar;
}

enum Pendidikan {
  Sekolah_Dasar,
  Sekolah_Menengah_Pertama,
  Sekolah_Menengah_Atas,
  Kuliah
}
