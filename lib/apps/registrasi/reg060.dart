import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/apps/registrasi/reg060_button.dart';
import 'package:voidrealm/apps/registrasi/reg070.dart';
import 'package:voidrealm/db/dbhelper.dart';
import 'package:voidrealm/db/db.dart';
import 'package:voidrealm/db/dbhelper_offline.dart';
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
  DbHelp dbHelp;
  DBHelper dbHelper = new DBHelper();

  List<DropdownMenuItem<String>> list;

  TextEditingController _textController = TextEditingController();
  TextEditingController _textControllerNama = TextEditingController();

  bool tampilkanText = false, isNamaCorrect = false, isNamaEmpty = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        tampilkanText = visibility;
      }
    });
  }

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
      if (Regex1.checkAlphabet(text)) {
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

    list = [];

    /// KELAS Db
    // Db.initialize().then((status) {
    //   if (status) {
    //     Db.getData().then((listmap) {
    //       listmap.map((e) {
    //         print(e.toString());
    //         return getDropDownWidget(e);
    //       }).forEach((dropdownItem) {
    //         list.add(dropdownItem);
    //       });
    //       setState(() {
    //
    //       });
    //     });
    //   }
    // });

    /// KELAS DBHelp (dbhelper_offline)
    dbHelp = new DbHelp();
    dbHelp.db;
  }

  double _value = 0, _valueTotal;

  /// THIS IS ORIGINALLY USED FOR SLIDER IN onChanged SECTION
  void _onChanged(double d) {
    setState(() {
      _value = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    _valueTotal = _value + 0 + 0;

    int _cobaVar = 0;

    /// KELAS DBHelper
    // dbHelper.initDB();/// NG SINI BS

    return MaterialApp(
      home: Material(
          child: Scaffold(
            // appBar: AppbarProgress(),
            appBar: AppBar(
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
                backgroundColor: Colors.white,
                //automaticallyImplyLeading: true
                elevation: 0.0, // for elevation
                titleSpacing: 0.0,
                // if you want remove title spacing with back button
                title: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,/// PERSEN TERISI DI START
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Text(
                              '${_valueTotal.round()}% terisi\n',
                              style: TextStyle(fontSize: 12, color: Colors.grey)
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.cyanAccent,
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                            value: _valueTotal * .1,
                          ),
                        )
                      ]
                  ),
                ),

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
            body: SingleChildScrollView(/// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                color: Colors.white,
                // height: MediaQuery.of(context).size.height * 1,
                child: Column(
                    children: <Widget>[
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
                                            image: AssetImage(
                                              'lib/assets/info_48.png',
                                            ),
                                            width: 12,
                                            height: 12,
                                          ),
                                          onTap: () {
                                            print('onTap info nilai angsuran');
                                          },
                                        ),

                                        /// SPASI ANTARA LOGO INFO DAN NILAI ANGSURAN
                                        Container(
                                          width: 10,
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
                                                    fontFamily: 'Sans'),
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
                                    fontFamily: 'Sans'),
                              ),
                            ),
                          ],
                          mainAxisSize: MainAxisSize.max,

                          /// MEMBAGI RUANG UNTUK KONTEN CHILD SESUAI JUMLAH CHILD DARI ROW
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),

                      /// LABEL DAN DROPDOWN PROPINSI
                      Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Propinsi',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                          ]
                      ),

                      Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.grey[200]
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )
                                ),

                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    hint: Text('Silahkan pilih'),
                                    items: list,
                                    isDense: true,
                                    isExpanded: true, /// supaya panah dropdown bisa berada di tepi kanan
                                    onChanged: (String value) {
                                      print('Silahkan pilih print');
                                    },
                                  ),
                                ),
                                // child: DropdownButton(
                                //   hint: Text('Silahkan pilih'),
                                //   onChanged: (value) {},
                                //   value: 'aaaa',
                                //   items: list,
                                //   isDense: true,
                                //   isExpanded: true,/// supaya panah dropdown bisa berada di tepi kanan
                                // ),
                              ),

                              /// DROPDOWN PROPINSI COBA
                              // child: DropdownPropinsi(),
                            ),
                          ]
                      ),

                      /// LABEL DAN DROPDOWN KOTA / KEC / LURAH
                      Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Kota / Kecamatan / Kelurahan',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                          ]
                      ),

                      Row(
                          children: <Widget>[
                            Expanded(
                              child: DropdownPropinsi(),
                            ),
                          ]
                      ),

                      /// LABEL DAN TEXTFIELD ALAMAT LENGKAP
                      Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Alamat lengkap (nama jalan/nomor rumah)',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ),
                          ]
                      ),

                      Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                    shape: BoxShape.rectangle),
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
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
                          ]
                      ),

                      /// LABEL DAN DROPDOWN LAMA TINGGAL
                      Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Lama tinggal',
                                style: TextStyle(color: Colors.cyan[600], fontSize: 12),
                              ),
                            ),
                          ]
                      ),

                      Row(
                          children: <Widget>[
                            Expanded(
                                child: DropdownLamatinggal()
                            )
                          ]
                      ),

                      /// LABEL DAN DROPDOWN LAMA TINGGAL
                      Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Agama',
                                style: TextStyle(color: Colors.cyan[600], fontSize: 12),
                              ),
                            ),
                          ]
                      ),

                      Row(
                          children: <Widget>[
                            Expanded(
                              child: DropdownAgama(),
                            )
                          ]
                      ),

                      /// BUTTON BERIKUTNYA
                      Reg060Button(
                        /// KALO DIKASI KEY DGN NAVIGATOR GINI, Reg060 TIDAK
                        /// TAMPIL TAPI LANGSUNG KE 070 (SETELAH NAVIGATED DARI 050)
                        // key: (){
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Reg070()),
                        //   );
                        // }(),
                      ),
                    ]
                ),
              ),
            ),
          )
      ),
    );
  }

  DropdownMenuItem<String> getDropDownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['ITEM'],
      child: Text(map['ITEM']),
      onTap: (){
        print('getDropDownWidget is tapped');
      },
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
