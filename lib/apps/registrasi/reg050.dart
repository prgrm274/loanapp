import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
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
import 'package:voidrealm/texts/t_email.dart';
import 'package:voidrealm/texts/t_namaibu.dart';
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
  TextEditingController _tecTanggal = TextEditingController();
  TextEditingController _tecNama = TextEditingController();
  TextEditingController _tecTempat = TextEditingController();
  TextEditingController _tecNamaIbu = TextEditingController();
  TextEditingController _tecEmail = TextEditingController();

  /// IS onTap CUKUP DIGUNAKAN 1X NG
  bool isOnTappedNama = false, isOnTappedTanggal = false,
      isOnTappedTempat = false, isOnTappedNamaIbu = false,
      isOnTappedEmail = false;

  /// DIINISIALISASI SETELAH ISONTAPPED TRUE NG
  static bool isFokusNama, isFokusTanggal, isFokusTempat, isFokusNamaIbu, isFokusEmail;
  static bool isNamaCorrect, isTanggalCorrect, isTempatCorrect, isNamaIbuCorrect, isEmailCorrect;

  /// VARIABEL UNTUK KONDISI TEXT FIELD
  final boxDecorationDefault = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey[200],
      shape: BoxShape.rectangle);
  final boxDecorationBenar = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue[200],
      shape: BoxShape.rectangle);
  final boxDecorationSalah = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.red[200],
      shape: BoxShape.rectangle);
  final boxDecorationFocus = BoxDecoration(
      color: Colors.white,
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
        )
      ],
      shape: BoxShape.rectangle);

  /// PROGRESS JANGAN DITARUH DI ONCHANGE KARENA ONCHANGE DYNAMIC
  /// JADI INPUT TANGGAL GA SAMPAI SELESAI, SAMPE BENAR TIAP ANGKA AKAN
  /// MEMBUAT PROGRESS DI MIN 1
  double _value = 0, _valueTotal;

  double _dNamalengkap = 0, _tanggalLahir = 0, _dTempatLahir = 0,
      _jenisKelamin = 0, _jumlahAnak = 0, _namaIbu = 0,
      _pendidikanTerakhir = 0, _email = 0;
  
  String imgAssetBack = 'lib/assets/grey_arrow_white.png';
  String imgAssetChat = 'lib/assets/chat_bubble_cyan.png';

  @override
  Widget build(BuildContext context) {
    _valueTotal = _value + _dNamalengkap + _dTempatLahir + 0;

    return MaterialApp(
      // home: Material(
      home: Scaffold(
        /// SEMENTARA APPBAR JADI SATU (NGGA IMPORT) UNTUK NGETES VALUE TERISI LANGSUNG DISINI
        appBar: AppBar(
          actions: <Widget>[
            new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Image(
                    image: AssetImage(imgAssetChat)
                )
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
          /// BACK NAVIGATION ICON
          /// Custom leading icon, such as back navigation icon or other
          /// warna kotaknya navigation icon
          leading: new Material(
            color: Colors.white,
            child: new InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              splashColor: Colors.red,
              child: new Container(/// kotaknya navigation icon
                  padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                  child: Image(
                      image: AssetImage(imgAssetBack)
                  )
              ),
            ),
          ),
          title: Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,/// PERSEN TERISI DI START
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Text(
                        '${_valueTotal.round()}% terisi\n',
                        // Text('$_value terisi, total = $_valueTotal\n',
                        // '$$progress terisi $_progres\n',
                        // '$_progres terisi\n',
                        style: TextStyle(fontSize: 12, color: Colors.grey)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.cyanAccent,
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                      value: _valueTotal * .1,
                      // value: _value * .1,
                      // value: progress,
                      // value: _progres,
                    ),
                  )
                ]
            ),
          ),
          // title: new SfulLinearprogressindicator(),
          // title: new ProgressIndicator1(),
          // title: Text('Custom Appbar'),
          // title:  UtilCommonWidget.addTextMedium('About US', Colors.white, 20.0, 1),

          titleSpacing: 0.0,
        ),

        /// SingleChildScrollView SOLUSI UNTUK SUPAYA BISA MUAT BERAPA PUN WIDGET
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
                children: <Widget>[

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

                  /// LABEL NAMA
                  Row(
                      children: <Widget>[
                        isOnTappedNama ?
                        (
                            isFokusNama ?
                            Reg050TextNamaLengkap() :
                            (
                                isNamaCorrect ?
                                Reg050TextNamaLengkap() :
                                ErrorTextMasukkanDataDgnBnr()
                            )
                        ) :
                        Reg050TextNamaLengkap(),
                      ]
                  ),
                  /// TF NAMA
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              decoration:
                              isOnTappedNama ?
                              (
                                  isFokusNama ?
                                  boxDecorationFocus :
                                  (
                                      isNamaCorrect ?
                                      boxDecorationBenar :
                                      boxDecorationSalah
                                  )
                              ) :
                              boxDecorationDefault,
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                              child: GestureDetector(
                                onTap: (){
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child: Focus(
                                  onFocusChange: (hasFokus) {
                                    setState(() {
                                      isFokusNama = hasFokus;

                                      if (_tecNama.text.indexOf(' ') >= 1 &&
                                          _tecNama.text.isNotEmpty) {
                                        isNamaCorrect = true;
                                        _dNamalengkap = 1;

                                        print(_tecNama.text);
                                      } else {
                                        isNamaCorrect = false;
                                        _dNamalengkap = 0;
                                      }

                                      // if (!isFokusNama) {
                                      // if (_tecNama.text.isEmpty) {
                                      //   isNamaCorrect = false;
                                      //   _dNamalengkap = 0;
                                      // } else {
                                      //   isNamaCorrect = true;
                                      //   _dNamalengkap = 1;
                                      // }
                                      // }
                                    });
                                  },
                                  child: TextField(
                                    controller: _tecNama,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Dian Permata Fransiska',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                      suffixIcon:
                                      _tecNama.text.isNotEmpty ?
                                      IconButton(
                                          onPressed: () {
                                            _tecNama.clear();
                                          },
                                          icon: Icon(Icons.clear)
                                      ) :
                                      null,
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        // if (value.indexOf(' ') >= 1 &&
                                        //     value.isNotEmpty) {
                                        //   isNamaCorrect = true;
                                        //   /// KALAU SET LINEAR VALUE DISINI TIAP
                                        //   /// HURUF DIITUNG
                                        //
                                        //   /// ONLY PRINT WHEN THERE'S SPACE
                                        //   print(value);
                                        // } else {
                                        //   isNamaCorrect = false;
                                        // }
                                      });
                                    },
                                    ///GET IS TAPPED FIRST BY ONTAP
                                    onTap: (){
                                      if (isOnTappedNama) {
                                        return null;

                                      } else {
                                        isOnTappedNama = true;
                                        /// MAKA BARU INISIALISASI VALUE ISFOKUS DISINI
                                        isFokusNama = false;
                                        isNamaCorrect = false;
                                      }
                                    },
                                  ),
                                ),
                              ),
                            )
                        ),
                      ]
                  ),

                  /// LABEL TANGGAL
                  Row(
                      children: <Widget>[
                        isOnTappedTanggal ?
                        (
                            isFokusTanggal ?
                            Reg050TextTglLahir() :
                            (
                                isTanggalCorrect ?
                                Reg050TextTglLahir() :
                                ErrorTextMasukkanDataDgnBnr()
                            )
                        ) :
                        Reg050TextTglLahir()
                      ]
                  ),

                  ///// Container() HNY UTK NMPILIN SPACE KOSONG

                  /// TF TANGGAL DGN PENGESAHAN PENATAAN
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                decoration:
                                isOnTappedTanggal ?
                                (
                                    isFokusTanggal ?
                                    boxDecorationFocus :
                                    (
                                        isTanggalCorrect ?
                                        boxDecorationBenar :
                                        boxDecorationSalah
                                    )
                                ) :
                                boxDecorationDefault,
                                margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                                child: GestureDetector(
                                  onTap: (){
                                    FocusScopeNode currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                  },
                                  child: Focus(
                                      onFocusChange: (hasFocus) {
                                        setState(() {
                                          isFokusTanggal = hasFocus;

                                          if (!isFokusTanggal) {
                                            if (_tecTanggal.text.isEmpty) {
                                              isTanggalCorrect = false;
                                            } else {
                                              isTanggalCorrect = true;
                                            }
                                          }
                                        });
                                      },
                                      child: TextField(
                                        controller: _tecTanggal,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          hintText: '01.01.1970',
                                          hintStyle: TextStyle(color: Colors.grey[400]),
                                          suffixIcon:
                                          _tecTanggal.text.isNotEmpty ?
                                          IconButton(
                                              onPressed: () {
                                                _tecTanggal.clear();
                                              },
                                              icon: Icon(Icons.clear)
                                          ) :
                                          null,
                                        ),
                                        inputFormatters: [DateTextFormatter()],
                                        keyboardType: TextInputType.number,
                                        onChanged: (String value) {
                                          setState(() {
                                            if (DateHelper.isValidDateBirth(value, 'dd/MM/yyyy')
                                                || value.isNotEmpty) {
                                              isTanggalCorrect = true;
                                            } else {
                                              isTanggalCorrect = false;
                                            }
                                          });
                                        },
                                        onTap: (){
                                          if (isOnTappedTanggal) {
                                            return null;

                                          } else {
                                            isOnTappedTanggal = true;
                                            isFokusTanggal = false;
                                            isTanggalCorrect = false;
                                          }
                                        },
                                      )
                                  ),
                                )
                            )
                        ),
                      ]
                  ),

                  /// LABEL TEMPAT LAHIR
                  isOnTappedTempat ?
                  (
                      isFokusTempat ?
                      Reg050TextTempatLahir() :
                      (
                          isTempatCorrect ?
                          Reg050TextTempatLahir() :
                          ErrorTextMasukkanDataDgnBnr()
                      )
                  ) :
                  Reg050TextTempatLahir(),

                  /// TF TEMPAT LAHIR
                  Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration:
                              isOnTappedTempat ?
                              (
                                  isFokusTempat ?
                                  boxDecorationFocus :
                                  (
                                      isTempatCorrect ?
                                      boxDecorationBenar :
                                      boxDecorationSalah
                                  )
                              ) :
                              boxDecorationDefault,
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                              child: GestureDetector(
                                onTap: (){
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child: Focus(
                                  onFocusChange: (hasFocus) {
                                    setState(() {
                                      isFokusTempat = hasFocus;

                                      if (!isFokusTempat) {
                                        if (_tecTempat.text.isEmpty) {
                                          isTempatCorrect = false;
                                          _dTempatLahir = 0;
                                        } else {
                                          isTempatCorrect = true;
                                          _dTempatLahir = 1;
                                        }
                                      }
                                    });
                                  },
                                  child: TextField(
                                    controller: _tecTempat,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: 'Masukkan tempat lahir',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                      suffixIcon:
                                      _tecTempat.text.isNotEmpty ?
                                      IconButton(
                                          onPressed: () {
                                            _tecTempat.clear();
                                          },
                                          icon: Icon(Icons.clear)
                                      ) : null,
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        if (value.length > 2 &&
                                            value.isNotEmpty) {
                                          isTempatCorrect = true;
                                        } else {
                                          isTempatCorrect = false;
                                        }
                                      });
                                    },
                                    onTap: (){
                                      if (isOnTappedTempat) {
                                        return null;

                                      } else {
                                        isOnTappedTempat = true;
                                        isFokusTempat = false;
                                        isTempatCorrect = false;
                                      }
                                    },
                                  ),
                                ),
                              )
                          ),
                        ),
                      ]
                  ),

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
                                  style: TextStyle(color: Colors.grey[400], fontSize: 15, fontFamily: 'Sans'),),
                              ]
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),
                      ],
                    ),
                  ),

                  /// LABEL DAN DROPDOWN JUMLAH ANAK
                  Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Jumlah anak',
                            style: TextStyle(
                                color: Colors.cyan[600],
                                fontSize: 12,
                                fontFamily: 'Sans'
                            ),
                          ),
                        ),
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Dropdown1JmlAnak(),
                                  ),
                                ]
                            )
                        )
                      ]
                  ),

                  /// LABEL NAMA IBU
                  Row(
                      children: <Widget>[
                        isOnTappedNamaIbu ?
                        (
                            isFokusNamaIbu ?
                            TNamaibu() :
                            (
                                isNamaIbuCorrect ?
                                TNamaibu() :
                                ErrorTextMasukkanDataDgnBnr()
                            )
                        ) :
                        TNamaibu(),
                      ]
                  ),
                  /// TF NAMA IBU
                  Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration:
                              isOnTappedNamaIbu ?
                              (
                                  isFokusNamaIbu ?
                                  boxDecorationFocus :
                                  (
                                      isNamaIbuCorrect ?
                                      boxDecorationBenar :
                                      boxDecorationSalah
                                  )
                              ) :
                              boxDecorationDefault,
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                              child: GestureDetector(
                                onTap: (){
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child: Focus(
                                  onFocusChange: (hasFokus) {
                                    setState(() {
                                      isFokusNamaIbu = hasFokus;

                                      if (!isFokusNamaIbu) {
                                        if (_tecNamaIbu.text.isEmpty) {
                                          isNamaIbuCorrect = false;
                                        } else {
                                          isNamaIbuCorrect = true;
                                        }
                                      }
                                    });
                                  },
                                  child: TextField(
                                    controller: _tecNamaIbu,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Nama ibu kandung',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                      suffixIcon:
                                      _tecNamaIbu.text.isNotEmpty ?
                                      IconButton(
                                          onPressed: () {
                                            _tecNamaIbu.clear();
                                            isNamaIbuCorrect = false;
                                          },
                                          icon: Icon(Icons.clear)
                                      ) :
                                      null,
                                    ),
                                    onChanged: (String value) {
                                      setState(() {
                                        if (value.isNotEmpty) {
                                          isNamaIbuCorrect = true;
                                        } else {
                                          isNamaIbuCorrect = false;
                                        }
                                      });
                                    },
                                    onTap: (){
                                      if (isOnTappedNamaIbu) {
                                        return null;

                                      } else {
                                        isOnTappedNamaIbu = true;
                                        isFokusNamaIbu = false;
                                        isNamaIbuCorrect = false;
                                      }
                                    },
                                  ),
                                ),
                              )
                          ),
                        ),
                      ]
                  ),

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
                  Row(
                      children: <Widget>[
                        Expanded(
                            child: DropdownPendidikanTerakhir050()
                        )
                      ]
                  ),

                  /// LABEL EMAIL
                  Row(
                      children: <Widget>[
                        isOnTappedEmail ?
                        (
                            isFokusEmail ?
                            Reg050TextEmail() :
                            (
                                isEmailCorrect ?
                                Reg050TextEmail() :
                                ErrorTextMasukkanDataDgnBnr()
                            )
                        ) :
                        Reg050TextEmail(),
                      ]
                  ),
                  /// TF EMAIL
                  Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration:
                              isOnTappedEmail ?
                              (
                                  isFokusEmail ?
                                  boxDecorationFocus :
                                  (
                                      isEmailCorrect ?
                                      boxDecorationBenar :
                                      boxDecorationSalah
                                  )
                              ) :
                              boxDecorationDefault,
                              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 2),
                              child: GestureDetector(
                                onTap: (){
                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }

                                  /// FLUTTERTOAST
                                  // Fluttertoast.showToast(
                                  //     msg: 'GestureDetector onTap EMAIL DONE',
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.TOP,
                                  //     backgroundColor: Colors.red,
                                  //     textColor: Colors.white,
                                  //     fontSize: 12.0
                                  // );
                                  /// TOAST
                                  Toast.show("onTap gesture detector", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                                },
                                child: Focus(
                                  onFocusChange: (hasFokus) {
                                    setState(() {
                                      isFokusEmail = hasFokus;

                                      if (!isFokusEmail) {
                                        if (_tecEmail.text.isEmpty) {
                                          isEmailCorrect = false;
                                        } else {
                                          isEmailCorrect = true;
                                        }
                                      }
                                    });
                                  },
                                  child: TextField(
                                    controller: _tecEmail,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Masukkan email aktif Anda dengan benar',
                                      hintStyle: TextStyle(color: Colors.grey[400]),
                                      suffixIcon:
                                      _tecEmail.text.isNotEmpty ?
                                      IconButton(
                                          onPressed: () {
                                            _tecEmail.clear();
                                          },
                                          icon: Icon(Icons.clear)
                                      ) :
                                      null,
                                    ),
                                    onChanged: (String value){
                                      setState(() {
                                        if (value.isNotEmpty) {
                                          isEmailCorrect = true;
                                        } else {
                                          isEmailCorrect = false;
                                        }
                                      });
                                    },
                                    onTap: (){
                                      if (isOnTappedEmail) {/// V
                                        ///
                                        return null;

                                      } else {
                                        isOnTappedEmail = true;
                                        isFokusEmail = false;
                                        isEmailCorrect = false;

                                        /// V ONLY ONCE
                                        // Fluttertoast.showToast(
                                        //     msg: 'TEXTFIELD EMAIL',
                                        //     toastLength: Toast.LENGTH_SHORT,
                                        //     gravity: ToastGravity.TOP,
                                        //     backgroundColor: Colors.red,
                                        //     textColor: Colors.white,
                                        //     fontSize: 12.0
                                        // );
                                      }
                                    },
                                  ),
                                ),
                              )
                          ),
                        ),
                      ]
                  ),
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
                            side: BorderSide(color: Colors.cyan)
                        ),
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