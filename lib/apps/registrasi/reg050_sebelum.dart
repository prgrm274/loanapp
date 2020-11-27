import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:voidrealm/appbars/appbar_progress.dart';
import 'package:voidrealm/apps/registrasi/reg060.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1_noscaffold_jmlanak.dart';
import 'package:voidrealm/errors/t_nama_lengkap_sesuai_ktp.dart';
import 'package:voidrealm/errors/t_tempat_lahir.dart';
import 'package:voidrealm/errors/t_masukkan_data_dgn_bnr.dart';
import 'package:voidrealm/errors/t_tgl_lahir.dart';
import 'package:voidrealm/radios/j_radio_custom.dart';
import 'package:voidrealm/regexes/alphanumeric.dart';
import 'package:voidrealm/validations/date_input_text_field.dart';
import 'package:voidrealm/validations/date_validator.dart';

/// SEBELUM FOCUS DISAMAIN DENGAN 040B
///
/// FOCUS WORK CUMA PAS KLIK SALAH SATU TF KAYAK NGEFLASH GITU
class Reg050 extends StatefulWidget {
  Reg050({
    Key key,
  }) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  Pendidikan _pendidikan = Pendidikan.Sekolah_Dasar;
  // FocusNode emailFocusNode;

  TextEditingController _textControllerTanggal = TextEditingController();
  TextEditingController _textControllerNama = TextEditingController();
  TextEditingController _textControllerTempat = TextEditingController();
  TextEditingController _textControllerNamaIbu = TextEditingController();
  TextEditingController _textControllerEmail = TextEditingController();

  // bool isTextMasukkanDataTanggalDgnBnrShowed = false;
  bool tampilkanTempat = false;

  // bool isNamaCorrect, isNamaEmpty = false;///IF THIS, isNamaCorrect IS NOT INITIALIZED
  // bool fokus = false; /// CUMA UNTUK COBA FOCUS UMUM, KALO PAKE INI DI TIAP TEXTFIELD GANTI WARNYA JADI BARENG SEMUA
  static bool isFokusNama = false, isFokusTanggal = false, isFokusTempat = false,
      isFokusNamaIbu = false, isFokusEmail = false;

  bool isNamaCorrect = false, isTanggalCorrect = false, isTempatCorrect = false,
      isNamaEmpty = false, isTanggalEmpty = false, isTempatEmpty = false;
  /// TEMPAT LAHIR TIDAK ADA VALIDASI
  bool isNamaIbuCorrect = false, isNamaIbuEmpty = false,
      isEmailCorrect = false, isEmailEmpty = false;

  /// IS onTap CUKUP DIGUNAKAN 1X
  bool isOnTappedNama = false, isOnTappedTanggal = false, isOnTappedTempat = false;

  /// VARIABEL UNTUK KONDISI TEXT FIELD
  final boxDecorationDefault = BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.grey[200], shape: BoxShape.rectangle);
  final boxDecorationBenar = BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.blue[200], shape: BoxShape.rectangle);
  final boxDecorationSalah = BoxDecoration(borderRadius: BorderRadius.circular(10),
      color: Colors.red[200], shape: BoxShape.rectangle);
  final boxDecorationFocus = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
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
        )
      ],
      color: Colors.white, shape: BoxShape.rectangle
  );

  /// PROGRESS JANGAN DITARUH DI ONCHANGE KARENA ONCHANGE DYNAMIC
  /// JADI INPUT TANGGAL GA SAMPAI SELESAI, SAMPE BENAR TIAP ANGKA AKAN
  /// MEMBUAT PROGRESS DI MIN 1
  // static double _progres;
  // static double progress = 0;
  double _value = 0, _valueTotal;

  double _dNamalengkap = 0, _tanggalLahir = 0, _dTempatLahir, _jenisKelamin = 0,
      _jumlahAnak = 0, _namaIbu = 0, _pendidikanTerakhir = 0, _email = 0;

  get getNamaLengkap => _dNamalengkap;

  @override
  Widget build(BuildContext context) {
    _valueTotal = _value + _dNamalengkap + 0;

    return MaterialApp(
      // home: Material(
      home: Scaffold(
        /// SEMENTARA APPBAR JADI SATU (NGGA IMPORT) UNTUK NGETES VALUE TERISI LANGSUNG DISINI
        appBar: AppBar(
          actions: <Widget>[
            new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Image(
                    image: AssetImage('lib/assets/chat_bubble_cyan.png')
                )
              // child: Icon(Icons.message)
            ),
            // addAppBarActionWidgetProfile(icon, 30.0, 30.0, 15.0) // add your custom action widget
          ],
          backgroundColor: Colors.white,
          //automaticallyImplyLeading: true
          elevation: 0.0, // for elevation
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
                      image: AssetImage('lib/assets/grey_arrow_white.png')
                  )
                // child: Icon(Icons.arrow_back_rounded)
                // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
              ),
            ),
          ),
          title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    '${_valueTotal.round()}% terisi\n',
                    // Text('$_value terisi, total = $_valueTotal\n',
                    // '$$progress terisi $_progres\n',
                    // '$_progres terisi\n',
                    style: TextStyle(fontSize: 12, color: Colors.grey)
                ),
                LinearProgressIndicator(
                  backgroundColor: Colors.cyanAccent,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                  value: _valueTotal * .1,
                  // value: _value * .1,
                  // value: progress,
                  // value: _progres,
                ),
              ]
          ),

          // title: new SfulLinearprogressindicator(),
          // title: new ProgressIndicator1(),
          // title: Text('Custom Appbar'),
          // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),
          titleSpacing: 0.0, // if you want remove title spacing with back button
        ),
        // appBar: AppbarProgress(
        //   namaLengkap: _textControllerNama.text,
        // ),
        // appBar: AppbarProgress(),
        body: SingleChildScrollView(
          /// SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
          // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

          child: Container(
            // height: MediaQuery.of(context).size.height,
            // height: MediaQuery.of(context).size.height * 1,
            // width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
                children: <Widget>[
                  // Appbar050(),

                  /// LABEL NAMA
                  isOnTappedNama ?
                  (isFokusNama ? Reg050TextNamaLengkap() :
                  (isNamaCorrect ? Reg050TextNamaLengkap() : ErrorTextMasukkanDataDgnBnr()
                  )
                  ) : Reg050TextNamaLengkap(),
                  // isNamaCorrect ? TextNamaLengkap() : TextMasukkanDataDgnBnr(),
                  // isNamaCorrect ? (isNamaFokus ? TextNamaLengkap() : TextMasukkanDataDgnBnr()) : TextNamaLengkap(),

                  /// TEXTFIELD NAMA
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Focus(
                              onFocusChange: (punyaFokus) {
                                setState(() {
                                  isFokusNama = punyaFokus;
                                  print('onFocusChange setState NAMA = $isFokusNama');
                                  // isNamaCorrect = punyaFokus;

                                  if (isNamaCorrect) {
                                    _dNamalengkap = 1;
                                  } else {
                                    _dNamalengkap = -1;
                                  }
                                });

                                /// SBLMNYA DI onChanged
                                /// REGEX CHECKS IF FIELD HAS/CONTAINS SPACE
                                if (_textControllerNama.text.indexOf(' ') >= 1) {
                                  /// 1, BERARTI MINIMAL 1 HURUF SEBELUM SPASI
                                  // if (_textControllerNama.text.indexOf(' ') >= 0) {/// 0, BERARTI IF HURUF PERTAMA ADLAAH SPASI
                                  // print('Field contains space, $isNamaCorrect');///DISINI isNamaCorrect LANGSUNG TRUE WALAU DITULIS DI BAWAH

                                  // isNamaFokus ? isNamaCorrect = false : isNamaCorrect = true;
                                  isNamaCorrect = true;
                                  _dNamalengkap = 1;
                                } else {
                                  // isNamaFokus ? isNamaCorrect = true : isNamaCorrect = false;
                                  isNamaCorrect = false;
                                }

                                /// GET FOCUS THEN SET _progres
                                // if (fokus = true) {
                                //   print('fokus di nama = $fokus');
                                //   if (isNamaCorrect == true) {
                                //     _progres = _progres + 1;
                                //   } else {
                                //     _progres = _progres - 1;
                                //   }
                                // } else {
                                //   print('fokus di nama = $fokus');
                                // }
                              },

                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                                decoration: isOnTappedNama ?
                                (isFokusNama ? boxDecorationFocus :
                                (isNamaCorrect ? boxDecorationBenar : boxDecorationSalah)) :
                                boxDecorationDefault,

                                // isOnTappedNama ? boxDecorationJustOnFocus : boxDecorationDefault,/// WITHOUT CORRECT OR NOT
                                // isOnTappedNama ?
                                // (isNamaCorrect ? boxDecorationBenar : boxDecorationSalah) :
                                // boxDecorationDefault,

                                /// PREVIOUS CONDITIONS
                                // isNamaFokus ?
                                // boxDecorationJustOnFocus : //null,
                                // (isNamaCorrect ? boxDecorationBenar : boxDecorationSalah),

                                /// PREVIOUS CONDITIONS
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
                                  onChanged: (String value) {
                                    /// _progres BUKAN DI ONCHANGE
                                    // if (_textControllerNama.text.isNotEmpty) {
                                    //   _progres = _progres + 1;
                                    //   print('text name is not empty, progres = '+_progres.toString());
                                    // } else {
                                    //   isNamaEmpty = true;
                                    //   _progres = _progres - 1;
                                    //   print('text name is empty, progres = '+_progres.toString());
                                    // }

                                    // _textControllerNama.text.isEmpty ?
                                    //     isNamaEmpty : !isNamaEmpty;

                                    /// NG V
                                    // _textControllerNama.text.isEmpty ?
                                    //     print('nama is empty') :
                                    // print('nama is correct');

                                    setState(() {});
                                    print('onChange isNamaCorrect = $isNamaCorrect');
                                  },
                                  ///GET FOCUS BY ONTAP
                                  onTap: (){
                                    isOnTappedNama = true;
                                    print('onTap NAMA LENGKAP');

                                    Fluttertoast.showToast(
                                        msg: 'onTap NAMA LENGKAP',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.TOP,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                    // isNamaFokus = true;
                                    // isTempatFokus = false;
                                  },
                                  controller: _textControllerNama,
                                  cursorColor: Colors.black,
                                  // keyboardType: inputType,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,

                                    hintText: 'Dian Permata Fransiska',
                                    hintStyle: TextStyle(color: Colors.grey[400]),

                                    /// NG
                                    /// x MUNCUL HANYA JIKA
                                    /// NOT EMPTY DAN LOST FOCUS
                                    suffixIcon: _textControllerNama.text.isNotEmpty ?
                                    IconButton(
                                      onPressed: () {
                                        _textControllerNama.clear();
                                        isNamaEmpty = true;
                                        isNamaCorrect = false;
                                        },
                                      icon: Icon(Icons.clear)
                                    ) : null,
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

                              )
                            )
                        ),
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

                  /// LABEL TANGGAL EDIT
                  isOnTappedTanggal ?
                  (isFokusTanggal ? Reg050TextTglLahir() :
                      (isTanggalCorrect ? Reg050TextTglLahir() :
                          ErrorTextMasukkanDataDgnBnr()
                      )
                  ) : Reg050TextTglLahir(),

                  ///// Container() HNY UTK NMPILIN SPACE KOSONG

                  /// TEXTFIELD TANGGAL EDIT DGN PENGESAHAN PENATAAN
                  Row(
                      children: <Widget>[
                        Expanded(
                          child: Focus(
                            onFocusChange: (punyaFokus) {
                              setState(() {
                                isFokusTanggal = punyaFokus;
                                // print('onFocusChange setState TANGGAL = $isTanggalFokus');
                              });
                              },
                            child: Container(
                              decoration: isOnTappedTanggal ?
                              (isFokusTanggal ? boxDecorationFocus :
                              (isTanggalCorrect ? boxDecorationBenar : boxDecorationSalah)) :
                              boxDecorationDefault,
                              // decoration: isTanggalFokus ?
                              // boxDecorationJustOnFocus :
                              // (
                              //     isTextFieldTanggalCorrect ?
                              //     boxDecorationBenar :
                              //     boxDecorationSalah
                              // ),
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                              // child: DateInputTextField(),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                inputFormatters: [DateTextFormatter()],
                                /// THE INPUT FORMAT FOR THE KEYBOARD
                                keyboardType: TextInputType.number,
                                controller: _textControllerTanggal,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  /// NG V JIKA PERLU ERROR TEXT
                                  // errorText: DateHelper.isValidDateBirth(
                                  //     _textController.text.toString(), 'dd/MM/yyyy') ?
                                  //     // (){_changed(true, "tag");}///ng
                                  //     null
                                  //     :  'Masukkan data dengan benar',
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent,
                                      backgroundColor: Colors.redAccent),
                                  hintText: '01.01.1970',
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  suffixIcon: _textControllerTanggal.text.isNotEmpty ?
                                  IconButton(
                                      onPressed: () {
                                        _textControllerTanggal.clear();
                                        isTanggalEmpty = true;
                                        isTanggalCorrect = false;
                                      },
                                      icon: Icon(Icons.clear)
                                  ) : null,
                                  // suffixIcon: isTanggalCorrect ?
                                  // null :
                                  // IconButton(/// NG V
                                  //     onPressed: () {
                                  //       _textControllerTanggal.clear();
                                  //       // _progres = _progres - 1;
                                  //       },
                                  //     /// NG V
                                  //     icon: Icon(Icons.clear)),
                                ),
                                onChanged: (String value) {
                                  if (DateHelper.isValidDateBirth(value, 'dd/MM/yyyy')) {
                                    isTanggalCorrect = true;

                                    // _cekTanggalCorrect(false, "tag");
                                    // _progres = _progres + 1;
                                    // print('TANGGAL IS TRUE, progres = ' +_progres.toString());
                                  }

                                  // else if (_textControllerTanggal.text.isEmpty) {
                                  //   isTextFieldTanggalCorrect = false;
                                  //
                                  //   _changed(true, "tag");
                                  //   _progres = _progres - 1;
                                  //   print('TANGGAL IS EMPTY, progres = ' +
                                  //       _progres.toString());
                                  //
                                  // }

                                  else {
                                    isTanggalCorrect = false;

                                    // _cekTanggalCorrect(true, "tag");

                                    // _progres = _progres - 1;
                                    // print('TANGGAL IS TRUE, progres = ' +_progres.toString());
                                  }

                                  setState(() {
                                    // _cekTanggalCorrect(false, "tag");
                                  });
                                },
                                onTap: (){
                                  isOnTappedTanggal = true;
                                },
                                // focusNode: FocusNode(///NG
                                //   canRequestFocus: true
                                // ),
                              )
                            )
                          ),
                        ),
                      ]
                  ),

                  /// LABEL TEMPAT LAHIR
                  isOnTappedTempat ?
                  (isFokusTempat ? TextTempatLahir() :
                  (isTempatCorrect ? TextTempatLahir() : ErrorTextMasukkanDataDgnBnr()
                  )
                  ) : TextTempatLahir(),

                  /// TEXTFIELD TEMPAT LAHIR
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Focus(
                              onFocusChange: (punyaFokus) {
                                setState(() {
                                  isFokusTempat = punyaFokus;
                                });

                                if (_textControllerTempat.text.length > 0) {
                                  isTempatCorrect = true;
                                  _dTempatLahir = 1;
                                } else {
                                  isTempatCorrect = false;
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                                decoration: isOnTappedTempat ?
                                (isFokusTempat ? boxDecorationFocus :
                                (isTempatCorrect ? boxDecorationBenar : boxDecorationSalah)) :
                                boxDecorationDefault,

                                // decoration: isTempatFokus ?
                                // boxDecorationJustOnFocus :
                                // (isTempatCorrect ? boxDecorationBenar : boxDecorationSalah),

                                child: TextFormField(
                                  onChanged: (String value) {

                                  },
                                  onTap: (){
                                    isOnTappedTempat = true;
                                    print('onTap TEMPAT LAHIR');
                                  },
                                  controller: _textControllerTempat,
                                  cursorColor: Colors.black,
                                  decoration: new InputDecoration(
                                    hintText: 'Masukkan tempat lahir',
                                    hintStyle: TextStyle(color: Colors.grey[400]),
                                    suffixIcon: _textControllerTempat.text.isNotEmpty ?
                                    IconButton(onPressed: () {
                                      _textControllerTempat.clear();
                                      isTempatEmpty = true;
                                      isTempatCorrect = false;
                                      },
                                        icon: Icon(Icons.clear)) : null,

                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none)
                                )
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
                      child: Text('Jenis kelamin',
                        style: TextStyle(color: Colors.grey, fontSize: 15, fontFamily: 'Sans'),),
                    ),
                  ]),

                  /// RADIOS
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Row(children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                Text('Laki-laki',
                                  style: TextStyle(color: Colors.grey[400], fontSize: 15, fontFamily: 'Sans'),),
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
                            isNamaIbuCorrect = hasFokus;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                          decoration: boxDecorationDefault,
                          // decoration: isNamaIbuCorrect
                          //     ? (_textControllerNamaIbu.text.isEmpty
                          //         ? boxDecorationFocus
                          //         : boxDecorationBenar)
                          //     : boxDecorationSalah,
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
                                isNamaIbuEmpty = true;
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
                        child: DropdownPendidikanTerakhir050(),
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
                      child: Container(
                        decoration: boxDecorationDefault,
                        // emailFocusNode.hasFocus ?ma
                        // boxDecorationJustOnFocus : (isEmailCorrect ? boxDecorationBenar : boxDecorationSalah),
                        child: TextField(
                          onTap: (){
                            // emailFocusNode.requestFocus();
                          },
                          onChanged: (String value){
                            if (value.isNotEmpty) {
                              isEmailCorrect = true;
                            } else {
                              isEmailCorrect = false;
                            }
                          },
                          // focusNode: emailFocusNode,
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
                              focusColor: Colors.greenAccent,
                              fillColor: Colors.green
                          ),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                      ),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
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

  /// THIS IS ORIGINALLY USED FOR SLIDER IN onChanged SECTION
  void _onChanged(double d) {
    setState(() {
      _value = d;
    });
  }

  double _setDoubleNama(){
    isNamaCorrect ? 1 : 0;
  }

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
        isNamaIbuCorrect = benar;
      }
    });
  }

  bool _cekNamaIfEmpty(String text) {
    setState(() {
      Regex1.checkAlphabet(text);
    });
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

  @override
  void initState() {
    // emailFocusNode = FocusNode();

    // if (isNamaCorrect & isTempatLahirCorrect) {/// CB
    //   _progres = _dNamalengkap + _tempatLahir;
    // }

    // if (isNamaCorrect) {
    //   progress += 1;
    // } else if (isTempatLahirCorrect) {
    //   progress += 1;
    // }

    super.initState();
  }


  @override
  void dispose() {
    // emailFocusNode.dispose();

    super.dispose();
  }

  void _cekTanggalCorrect(bool visibility, String field) {
    setState(() {
      if (field == "tag") {
        // isTextMasukkanDataTanggalDgnBnrShowed = visibility;
        isTanggalCorrect = visibility;
      }
    });
  }
}

enum gender { l, p }

enum Pendidikan {
  Sekolah_Dasar,
  Sekolah_Menengah_Pertama,
  Sekolah_Menengah_Atas,
  Kuliah
}
