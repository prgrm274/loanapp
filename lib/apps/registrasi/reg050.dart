import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/apps/registrasi/reg060.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';
import 'package:voidrealm/radios/j_radio_custom.dart';
import 'package:voidrealm/regexes/alphanumeric.dart';
import 'package:voidrealm/validations/date_input_text_field.dart';
import 'package:voidrealm/validations/date_validator.dart';

class Reg050 extends StatefulWidget {
  Reg050({Key key}) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _textControllerNama = TextEditingController();
  TextEditingController _textControllerTempat = TextEditingController();
  TextEditingController _textControllerNamaIbu = TextEditingController();
  TextEditingController _textControllerEmail = TextEditingController();

  bool tampilkanText = false;
  bool tampilkanTempat = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        tampilkanText = visibility;
      }
    });
  }

  // bool isNamaCorrect, isNamaEmpty = false;///IF THIS, isNamaCorrect IS NOT INITIALIZED
  bool isNamaCorrect = false, isNamaEmpty = false;

  bool isTempatLahirCorrect, isTempatLahirEmpty = false;

  bool isTextFieldNamaIbuCorrect = false, isTextFieldNamaIbuEmpty = false;

  bool isTextFieldEmailCorrect, isTextFieldEmailEmpty = false;

  /// VARIABEL UNTUK KONDISI TEXT FIELD
  final boxDecorationNamaBenar = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[200],
      shape: BoxShape.rectangle);
  final boxDecorationNamaBenarButEmpty = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey[800].withOpacity(0.5),
          spreadRadius: 0.2,

          /// SEBERAPA JAUH PENDARAN SHADOW
          // spreadRadius: 5,
          blurRadius: 7,

          /// DX PENDAR KE SAMPING, DY PENDAR KE BAWAH
          offset: Offset(0, 1), // changes position of shadow
          // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
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

  void _cekNamaIbuKandung(bool benar, String text) {
    setState(() {
      if (Regex1.checkAlphabet(text)) {
        isTextFieldNamaIbuCorrect = benar;
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
        // home: Material(
      home: Scaffold(
        appBar: AppbarProgress(),
        body: SingleChildScrollView(
          /// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
          // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

          child: Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            color: Colors.white,
            // height: MediaQuery.of(context).size.height * 1,
            child: Column(children: <Widget>[
              /// APPBAR
              // Appbar050(),



              /// LABEL DAN NAMA KTP EDIT
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                alignment: Alignment.topLeft,
                child: Text(
                  'Nama lengkap sesuai KTP',
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 12, fontFamily: 'Sans'),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Focus(
                      onFocusChange: (punyaFokus) {
                        setState(() {
                          isNamaCorrect = punyaFokus;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                        decoration: isNamaCorrect
                            ? (_textControllerNama.text.isEmpty
                            ? boxDecorationNamaBenarButEmpty
                            : boxDecorationNamaBenar)
                            : boxDecorationNamaSalah,

                        // isNamaEmpty
                        // ?
                        // boxDecorationNamaBenar
                        // :
                        // boxDecorationNamaSalah,

                        // (
                        //     // (
                        //         _textControllerNama.text.isNotEmpty
                        //         // && _textControllerNama.text == 'a'
                        //     // )
                        //         ?
                        //     BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: Colors.grey[200],
                        //         shape: BoxShape.rectangle) :
                        //         (){ print('False'); }
                        // ),

                        // (
                        //     Regex1.checkAlphabet(_textControllerNama.text) ?
                        // BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.grey[200],
                        //     shape: BoxShape.rectangle)
                        //     :
                        //   BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.red[200],
                        //       shape: BoxShape.rectangle)
                        // ),

                        child: TextFormField(
                          controller: _textControllerNama,
                          onChanged: (String value) {
                            if (_textControllerNama.text.isNotEmpty) {
                              print('text name is not empty');
                            } else {
                              isNamaEmpty = true;
                              print('text name is empty');
                            }

                            // _textControllerNama.text.isEmpty ?
                            //     isNamaEmpty : !isNamaEmpty;

                            /// ngbs
                            // _textControllerNama.text.isEmpty ?
                            //     print('nama is empty') :
                            // print('nama is correct');
                          },
                          cursorColor: Colors.black,
                          // keyboardType: inputType,
                          decoration: InputDecoration(
                            hintText: 'Dian Permata Fransiska',
                            hintStyle: TextStyle(color: Colors.grey[400]),

                            /// NG
                            /// X MUNCUL HANYA JIKA
                            /// NOT EMPTY
                            /// DAN
                            /// LOST FOCUS
                            suffixIcon: _textControllerNama.text.isNotEmpty
                                ? IconButton(
                              onPressed: () => _textControllerNama.clear(),
                              icon: Icon(Icons.clear),
                            )
                                : null,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),

                        /// TEXTFIELD NAMA LENGKAP
                        // child: TextField(
                        //   controller: _textControllerNama,
                        //   onChanged: (String value) {
                        //     if (_textControllerNama.text.isNotEmpty) {
                        //       print('text name is not empty');
                        //     } else {
                        //       isNamaEmpty = true;
                        //       print('text name is empty');
                        //     }
                        //
                        //     // _textControllerNama.text.isEmpty ?
                        //     //     isNamaEmpty : !isNamaEmpty;
                        //
                        //     /// ngbs
                        //     // _textControllerNama.text.isEmpty ?
                        //     //     print('nama is empty') :
                        //     // print('nama is correct');
                        //   },
                        //   decoration: InputDecoration(
                        //     hintText: 'Dian Permata Fransiska',
                        //     hintStyle: TextStyle(color: Colors.grey),
                        //     suffixIcon: _textControllerNama.text.isNotEmpty
                        //         ? IconButton(
                        //       onPressed: () => _textControllerNama.clear(),
                        //       icon: Icon(Icons.clear),
                        //     )
                        //         : null,
                        //   ),
                        // ),
                      ),
                    )),
              ]),

              //// LABEL DAN TANGGAL EDIT
              // Row(children: <Widget>[
              //   Container(
              //     margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              //     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //     alignment: Alignment.topLeft,
              //     child: Text(
              //       'Tanggal lahir',
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 12
              //       ),
              //     ),
              //   ),
              // ]),
              // Row(children: <Widget>[
              //   Expanded(
              //     child: Container(
              //       margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              //       padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.grey[200],
              //           shape: BoxShape.rectangle),
              //       child: TextField(
              //         decoration: InputDecoration(
              //           hintText: '24.05.1986',
              //           hintStyle: TextStyle(color: Colors.grey),
              //           suffixIcon: IconButton(
              //             // onPressed: () => tecHape.clear(),
              //             icon: Icon(Icons.clear),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ]),

              /// LABEL DAN TANGGAL EDIT DGN PENGESAHAN PENATAAN
              tampilkanText
                  ? Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Masukkan data dengan benar',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ])
                  : Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Tanggal lahir',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'Sans'),
                  ),
                ),
              ]),
              // ]) : Container(),/// Container() HNY UTK NMPILIN SPACE KOSONG
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                    decoration: tampilkanText
                        ?

                    ///ng bs
                    BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red[200],
                        shape: BoxShape.rectangle)
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle),
                    //// WITH IMPORT
                    // child: DateInputTextField(),
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        /// ng bs JIKA PERLU ERROR TEXT
                        // errorText: DateHelper.isValidDateBirth(
                        //     _textController.text.toString(), 'dd/MM/yyyy') ?
                        //     // (){_changed(true, "tag");}///ng
                        //     null
                        //     :  'Masukkan data dengan benar',
                        errorStyle: TextStyle(
                            color: Colors.redAccent,
                            backgroundColor: Colors.redAccent),
                        hintText: '01.01.1970',
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: tampilkanText
                            ?

                        ///ngbs
                        IconButton(
                          onPressed: () => _textController.clear(),

                          ///ngbs
                          icon: Icon(Icons.clear),
                        )
                            : null,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),

                      /// MAXLENGTH MENAMPILKAN 10/10
                      // maxLength: 10,
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
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'Sans'),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                    child: Focus(
                      onFocusChange: (punyaFokus) {
                        setState(() {
                          isTempatLahirEmpty = punyaFokus;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                            shape: BoxShape.rectangle),
                        child: TextFormField(
                          controller: _textControllerTempat,
                          decoration: isTempatLahirEmpty
                              ? new InputDecoration(
                            fillColor: Colors.yellowAccent,
                            focusColor: Colors.yellowAccent,
                            hintText: 'Masukkan tempat lahir',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () => _textControllerTempat.clear(),
                              icon: Icon(Icons.clear),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          )
                              : (_textControllerTempat.text.isNotEmpty
                              ? new InputDecoration(
                            fillColor: Colors.yellowAccent,
                            focusColor: Colors.yellowAccent,
                            hintText: 'Masukkan tempat lahir',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  _textControllerTempat.clear(),
                              icon: Icon(Icons.clear),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          )
                              : new InputDecoration(
                            fillColor: Colors.yellowAccent,
                            focusColor: Colors.yellowAccent,
                            hintText: 'Masukkan tempat lahir',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: null,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          )),
                        ),
                      ),
                    )),
              ]),

              /// LABEL DAN RADIO JENIS KELAMIN
              // Row(children: <Widget>[
              //   Container(
              //     margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              //     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //     alignment: Alignment.topLeft,
              //     child: Text(
              //       'Jenis kelamin',
              //       style: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 15
              //       ),
              //     ),
              //   ),
              // ]),
              // /// RADIOS
              // Container(
              //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
              //         child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: <Widget>[
              //               Radio(
              //                 /// IF NOT TOGGLEABLE IT WILL CAN NOT BE UNSELECTED
              //                 toggleable: true,
              //                 mouseCursor: MouseCursor.defer,
              //                 materialTapTargetSize: MaterialTapTargetSize.padded,
              //                 activeColor: Colors.grey[600],
              //                 value: 0,
              //                 groupValue: _radioValue1,
              //                 onChanged: _handleRadioValueChange1,
              //               ),
              //               Text(
              //                 'Laki-laki',
              //                 style: TextStyle(
              //                     color: Colors.grey[400],
              //                     fontSize: 13
              //                 ),
              //               ),
              //             ]
              //         ),
              //       ),
              //       Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: <Widget>[
              //             Radio(
              //               toggleable: true,
              //               mouseCursor: MouseCursor.defer,
              //               materialTapTargetSize: MaterialTapTargetSize.padded,
              //               activeColor: Colors.grey[600],
              //               /// THESE THREE BELOW ARE RELATED TO EACH OTHER
              //               value: 1,
              //               onChanged: _handleRadioValueChange2,
              //               groupValue: _radioValue2,
              //             ),
              //             Text(
              //               'Perempuan',
              //               style: TextStyle(
              //                   color: Colors.grey[400],
              //                   fontSize: 13
              //               ),
              //             ),
              //           ]
              //       ),
              //     ],
              //   ),
              // ),

              /// LABEL DAN RADIO JENIS KELAMIN
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Jenis kelamin',
                    style: TextStyle(
                        color: Colors.grey, fontSize: 15, fontFamily: 'Sans'),
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
                              value: gender.l,
                              groupValue: _gender,
                              onChanged: (gender value) {
                                setState(() {
                                  _gender = value;
                                });
                                print('Laki-laki');
                              },
                            ),
                            Text(
                              'Laki-laki',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                  fontFamily: 'Sans'),
                            ),
                          ]),
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: gender.p,
                          groupValue: _gender,
                          onChanged: (gender value) {
                            setState(() {
                              _gender = value;
                            });
                            print('perempuan');
                          },
                        ),
                        Text(
                          'Perempuan',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                              fontFamily: 'Sans'),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                ),
              ),

              /// SHOWING RESULT OF WHICH RADIO IS CHOSEN, LATER DOESN'T USE THIS
              // Row(children: <Widget>[
              //   Container(
              //     margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              //     padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              //     alignment: Alignment.topLeft,
              //     child: Text(
              //       (() {
              //         switch (_gender) {
              //           case gender.l:
              //             return 'L.';
              //           case gender.p:
              //             return 'P.';
              //         }
              //       }()),
              //       style: TextStyle(fontSize: 12),
              //     ),
              //
              //     /// or
              //     //Text(_gender == gender.l ?'This person is a man.' :'This person is a woman.')
              //   ),
              // ]),

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
                        fontSize: 12,
                        fontFamily: 'Sans'),
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

              /// LABEL DAN NAMA IBU KANDUNG
              Row(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Nama ibu kandung',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'Sans'),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Focus(
                    onFocusChange: (hasFokus) {
                      setState(() {
                        isTextFieldNamaIbuCorrect = hasFokus;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: isTextFieldNamaIbuCorrect
                          ? (_textControllerNamaIbu.text.isEmpty
                          ? boxDecorationNamaBenarButEmpty
                          : boxDecorationNamaBenar)
                          : boxDecorationNamaSalah,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: Colors.grey[200],
                      //     shape: BoxShape.rectangle
                      // ),
                      child: TextField(
                        controller: _textControllerNamaIbu,
                        onChanged: (String value) {
                          if (_textControllerNamaIbu.text.isNotEmpty) {
                            print('name Ibu is not empty');
                          } else {
                            isTextFieldNamaIbuEmpty = true;
                            print('name Ibu is empty');
                          }
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          fillColor: Colors.yellowAccent,
                          focusColor: Colors.yellowAccent,
                          hintText: 'Nama ibu kandung',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () => _textControllerNamaIbu.clear(),
                            icon: Icon(Icons.clear),
                          ),
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
                        fontSize: 12,
                        fontFamily: 'Sans'),
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
                        color: Colors.grey[400],
                        fontSize: 12,
                        fontFamily: 'Sans'),
                  ),
                ),
              ]),
              Row(children: <Widget>[
                Expanded(
                  child: Focus(
                    onFocusChange: (hasFokus) {
                      setState(() {
                        isTextFieldEmailCorrect = hasFokus;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle),
                      child: TextField(
                        controller: _textControllerEmail,
                        decoration: InputDecoration(
                          /// SELAIN TEXTFORMFIELD, TEXTFIELD JUGA BISA PAKE InputBorder.none
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,

                          hintText: 'Masukkan email aktif Anda dengan benar',
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            onPressed: () => _textControllerEmail.clear(),
                            icon: _textControllerEmail.text.isNotEmpty
                                ? Icon(Icons.clear)
                                : new Icon(null),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    onPressed: () {
                      /// NAVIGATE TO ANOTHER CLASS ROUTE
                      /// TO REGISTRASI DOMISILI
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reg060()),
                      );
                    },
                    textColor: Colors.white,
                    color: Colors.cyan,
                    child: Text('Berikutnya'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                        side: BorderSide(color: Colors.cyan)),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    // )
    );
  }

  gender _gender = gender.l;

  int _radioValue1 = -1;
  int correctScore = 0;
  int _radioValue2 = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          // Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          print('Case 0');
          correctScore++;
          break;
        case 1:
          print('Case 1');
          break;
      }
    });
  }

  void _handleRadioValueChange2(int value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          // Fluttertoast.showToast(msg: 'Correct !',toastLength: Toast.LENGTH_SHORT);
          print('Case 0');
          correctScore++;
          break;
        case 1:
          print('Case 1');
          break;
      }
    });
  }

  Pendidikan _pendidikan = Pendidikan.Sekolah_Dasar;
}

enum gender { l, p }

enum Pendidikan {
  Sekolah_Dasar,
  Sekolah_Menengah_Pertama,
  Sekolah_Menengah_Atas,
  Kuliah
}
