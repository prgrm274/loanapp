import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';
import 'package:voidrealm/numpads/flutter_numpad_widget_example.dart';
import 'package:voidrealm/numpads/custom_numpad2.dart';
import 'package:voidrealm/numpads/pinpad/numpad.dart';
import 'package:voidrealm/numpads/pinpad/numpad_controller.dart';

class Reg040BOTP extends StatefulWidget {
  Reg040BOTP({Key key}) : super(key: key);

  @override
  _Reg040BOTPState createState() => _Reg040BOTPState();
}

class _Reg040BOTPState extends State<Reg040BOTP> {
  final tecSeluler = TextEditingController();
  final tecOTP = TextEditingController();
  static bool isFokusSel = false;
  static bool isFokusOtp = false;

  @override
  void initState() {
    super.initState();
    // tecHape.addListener(_printLatestValue);
    // tecPasw.addListener(_printLatestValue2);
  }

  @override
  void dispose() {
    tecSeluler.dispose();
    tecOTP.dispose();
    super.dispose();
  }

  _listenerTecSeluler() {
    print("First text field: ${tecSeluler.text}");
  }

  _listenerTecOTP() {/// VALUE DAN TEXT HASILNYA SAMA
    print("Second text field: ${tecOTP.value}");
  }

  final boxDecorationFocus = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.cyan[700],
      shape: BoxShape.rectangle);
  final boxDecorationDefault = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.cyan[600],
      shape: BoxShape.rectangle);

  static String emptyForOTP = '';
  int maxLength = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 10.0,
          backgroundColor: Colors.cyan,
          title: Text('1 dari 7'),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.red,
            child: new Container(
              /// kotaknya navigation icon
              ///
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white
                )
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(5.0),
          color: Colors.cyan,
          child: Column(
              children: <Widget>[
                /// LABEL SMS akan terkirim
                Container(
                    child: Text(
                        'SMS akan terkirim ke hp Anda dalam 30 detik',
                        style: TextStyle(
                            fontSize: 12, color: Colors.white)
                    ),
                    margin: EdgeInsets.fromLTRB(20, 0, 40, 20),
                    alignment: Alignment.topLeft
                ),

                /// ROW LABEL DAN TF NO TEL SELULER, OTP
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /// LABEL NOMOR
                      Expanded(
                        flex: 5,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,// rata kiri
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                    'Nomor telepon seluler',
                                    style: TextStyle(color: Colors.white)
                                ),
                              ),

                              /// TF NOMOR SELULER
                              Container(
                                decoration:
                                isFokusSel ?
                                boxDecorationFocus :
                                boxDecorationDefault,
                                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                width: 250,
                                child: GestureDetector(
                                  onTap: () {
                                    FocusScopeNode currentFocus = FocusScope
                                        .of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    print('onTap click is working!');
                                  },
                                  child: Focus(
                                    onFocusChange: (punyaFokus) {
                                      setState(() {
                                        isFokusSel = punyaFokus;
                                        print('onFocusChange setState SELULER = $isFokusSel');
                                      });
                                    },
                                    child: TextField(
                                      controller: tecSeluler,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                          hintText: '0821 1234 5678',
                                          hintStyle: TextStyle(color: Colors.white70),
                                          isDense: true,
                                          suffixIcon: IconButton(
                                              onPressed: () => tecSeluler.clear(),
                                              icon: Icon(Icons.clear, color: Colors.white60)
                                          )
                                      ),
                                      onChanged: (String s){
                                        print('$s is printed');
                                      },
                                      readOnly: true,
                                      showCursor: true,
                                      style: isFokusSel ?
                                      TextStyle(color: Colors.white) :
                                      TextStyle(color: Colors.white70),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),

                      /// jarak antara no telp sel dan otp
                      // Spacer(flex: 1,),

                      /// LABEL OTP
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                      'Kode OTP salah',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10
                                      )
                                  ),
                                ),

                                /// TEXTFIELD OTP
                                Container(
                                  decoration: isFokusOtp ?
                                  boxDecorationFocus :
                                  boxDecorationDefault,
                                  height: 48,///NAPA NI HRS PAKE HEIGHT GA KYK NO TELP
                                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  width: 80,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('onTap click is working!');
                                    },
                                    child: Focus(
                                      onFocusChange: (isFocus) {
                                        setState(() {
                                          isFokusOtp = isFocus;
                                          print('onFocusChange setState OTP = $isFokusOtp');
                                        });
                                      },
                                      child: TextField(
                                        controller: tecOTP,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                            /// REMOVE LABEL OF MAXLENGTH TF (4/4)
                                            counterText: '',
                                            border: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            hintText: '0000',
                                            hintStyle: TextStyle(color: Colors.white70),
                                            isDense: true
                                        ),

                                        keyboardType: TextInputType.number,

                                        /// OPTS OF LIMITING TF LENGTH
                                        /// OPT 1
                                        // buildCounter: (BuildContext context, {
                                        //   int currentLength,
                                        //   int maxLength,
                                        //   bool isFocused
                                        // }) => null,
                                        // maxLength: 4,
                                        /// REPLACEMENT FOR MAXLENGTH AND ENFORCE TP GA BISA
                                        /// tutorial: used with TextFormField
                                        // inputFormatters: [
                                        //   new LengthLimitingTextInputFormatter(4),
                                        // ],
                                        /// IT'S A BUG THAT MAXLENGTH AND ENFORCE DOESN'T WORK
                                        /// tutorial: used with TextField
                                        // maxLength: 4,
                                        // maxLengthEnforced: true,
                                        /// REPLACEMENT FOR LENGTHLIMITING YG GA BISA JUGA
                                        // onChanged: (String s) {
                                        //   if (s.length <= maxLength) {
                                        //     emptyForOTP = s;
                                        //   } else {
                                        //     // tecOTP.text = emptyForOTP;
                                        //
                                        //     tecOTP.value = new TextEditingValue(
                                        //         text: emptyForOTP,
                                        //         selection: new TextSelection(
                                        //             baseOffset: maxLength,
                                        //             extentOffset: maxLength,
                                        //             affinity: TextAffinity.downstream,
                                        //             isDirectional: false
                                        //         ),
                                        //         composing: new TextRange(start: 0, end: maxLength)
                                        //     );
                                        //     tecOTP.text = emptyForOTP;
                                        //   }
                                        // },

                                        onChanged: (String s){
                                          print('$s is printed');
                                        },

                                        readOnly: true,
                                        showCursor: true,
                                        style: isFokusOtp ? TextStyle(color: Colors.white) :
                                        TextStyle(color: Colors.white70),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                /// LABEL MEMASUKKAN KODE (SYARAT KETENTUAN)
                Container(
                  margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: new TextSpan(
                      children: [
                        new TextSpan(
                          text: 'Memasukkan kode ini berarti Anda mengerti dan setuju terhadap syarat dan ',
                          style: new TextStyle(color: Colors.grey[100], fontSize: 11),
                        ),
                        new TextSpan(
                          text: 'ketentuan kami',
                          style: new TextStyle(
                              color: Colors.cyan[800],
                              decoration: TextDecoration.underline,
                              fontSize: 11),
                          recognizer: new TapGestureRecognizer()..onTap = () {
                            /// SHOW KETENTUAN KAMI DIALOG
                            print('LINK');
                          },
                        ),
                        new TextSpan(
                          text: '. Semua tindakan Anda adalah atas nama pribadi.',
                          style: new TextStyle(color: Colors.grey[100], fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.fromLTRB(20, 5, 40, 0),
                //   child: Linkify(
                //       text: 'Memasukkan kode ini berarti Anda mengerti dan setuju terhadap syarat dan ketentuan kami.'
                //           ' Semua tindakan Anda adalah atas nama pribadi.',
                //       style: TextStyle(color: Colors.white, fontSize: 11)
                //   )
                // ),

                /// BUTTON Kirimkan aku kode
                /// KALO MARGIN DIKEBAWAHIN, BUTTON CALC AKAN NGIKUT MENGECIL
                /// MENYESUAIKAN POSISI INI
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: RaisedButton(
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Reg050()
                                )
                            );
                          },
                          textColor: Colors.white60,
                          color: Color.fromRGBO(0, 160, 176, 100),
                          child: Text('Kirimkan aku kode'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.cyan)
                          )
                      )
                  ),
                ),

                /// CALCULATOR BUTTONS
                Expanded(
                    child: Container(
                      ///0,50,0,0
                      height: MediaQuery.of(context).size.height * .35,
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: GridButton(
                          borderColor: Colors.transparent,
                          hideSurroundingBorder: true,
                          onPressed: (dynamic val) {
                            /// BRING BUTTONS VALUE TO TEXT FIELD
                            /// NG V
                            if (isFokusSel) {
                              tecSeluler.text = tecSeluler.text + val.toString();

                              /// THEN PUT CURSOR TO END AFTER EACH OF PRESSING BUTTON V
                              String s = tecSeluler.text;
                              final seleksi = TextSelection.collapsed(offset: s.length);
                              tecSeluler.selection = seleksi;

                              print(tecSeluler.text);

                              // if (tecSeluler.text.contains('x')) {
                              //   /// HANDLING BACKSPACE NG CUMA NAMPILIN HURUF TERAKHIR
                              //   print(tecSeluler.text
                              //       .toString()
                              //       .substring(tecSeluler.text.length - 1));
                              // }
                            } else {
                              tecOTP.text = tecOTP.text + val.toString();

                              /// THEN PUT CURSOR TO END AFTER EACH OF PRESSING BUTTON V
                              String s = tecOTP.text;
                              final seleksi = TextSelection.collapsed(offset: s.length);
                              tecOTP.selection = seleksi;

                              print(tecOTP.text);

                              if (tecOTP.text.length > 4) {
                                tecOTP.text = tecOTP.text.substring(0, tecOTP.text.length - 1);
                              }

                              // if (tecOTP.text.length > 4) {
                              //   tecOTP.clear();/// NG V KEREN
                              // }
                            }
                          },
                          items: [
                            [
                              // GridButtonItem lain misal backspace item,
                              GridButtonItem(
                                title: '1',
                                textStyle: TextStyle(color: Colors.white, fontSize: 24),
                                // value: (dynamic v) {
                                //   Fluttertoast.showToast(msg: '1', toastLength: Toast.LENGTH_SHORT);
                                // },
                                value: 1,
                                child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white,
                                                width: 1.0)
                                        )
                                    ),
                                    child: Align(
                                        alignment: FractionalOffset.center,
                                        /// PRIORITAS TAMPILNYA TEXT > GRIDBUTTONITEM TITLE
                                        child: Text(
                                            '1',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24)
                                        )
                                    )
                                ),
                              ),
                              GridButtonItem(
                                  title: '2',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0)
                                          )
                                      ),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '2',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)
                                          )
                                      )
                                  ),
                                  value: '2',
                                  longPressValue: 'long'),
                              GridButtonItem(
                                  title: '3',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0)
                                          )
                                      ),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '3',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)
                                          )
                                      )
                                  ),
                                  value: '3',
                                  longPressValue: 'long'),
                              /// FLEX WILL MAKE IT WIDER
                              // GridButtonItem(title: 'Title 3', flex: 2),
                            ],
                            [
                              GridButtonItem(
                                  title: '4',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0)
                                          )
                                      ),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '4',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)
                                          )
                                      )
                                  ),
                                  value: '4',
                                  longPressValue: 'long'),
                              GridButtonItem(
                                  title: '5',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white,
                                                width: 1.0)
                                        )
                                    ),
                                    child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text(
                                          '5',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24)),
                                    ),
                                  ),
                                  value: '5',
                                  longPressValue: 'long'),
                              GridButtonItem(
                                  title: '6',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                    width: 70,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.white,
                                                width: 1.0)
                                        )
                                    ),
                                    child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text(
                                          '6',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24)
                                      ),
                                    ),
                                  ),
                                  value: '6',
                                  longPressValue: 'long'),
                            ],
                            [
                              GridButtonItem(
                                  title: '7',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0)
                                          )
                                      ),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '7',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)
                                          )
                                      )
                                  ),
                                  // value: (dynamic v) {
                                  //   Fluttertoast.showToast(msg: '7', toastLength: Toast.LENGTH_SHORT);
                                  // }
                                  value: '7',
                                  longPressValue: 'long'),
                              GridButtonItem(
                                  title: '8',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0))),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '8',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)))),
                                  value: '8',
                                  longPressValue: 'long'),
                              GridButtonItem(
                                  title: '9',
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white,
                                                  width: 1.0))),
                                      child: Align(
                                          alignment:
                                          FractionalOffset.center,
                                          child: Text(
                                              '9',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 24)
                                          )
                                      )
                                  ),
                                  value: '9',
                                  longPressValue: 'long'),
                            ],
                            [
                              GridButtonItem(title: ''),
                              GridButtonItem(
                                title: '0',
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 24),
                                value: 0,

                                /// IF NULL, WILL USE THE TITLE
                              ),
                              GridButtonItem(
                                  child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: RaisedButton(
                                          color: Colors.cyan,
                                          elevation: 0,
                                          onPressed: () {
                                            if (isFokusSel) {
                                              tecSeluler.text = tecSeluler.text.toString().substring(0, tecSeluler.text.length - 1);
                                            } else {
                                              tecOTP.text = tecOTP.text.toString().substring(0, tecOTP.text.length - 1);
                                            }
                                          },
                                          child: Icon(Icons.backspace, color: Colors.white, size: 28)
                                      )
                                  )
                              ),
                            ],
                          ]
                      ),
                    )
                )
              ]
          ),
        ),
      ),
    );
  }
}
