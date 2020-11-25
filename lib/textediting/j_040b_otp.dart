import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  _listenerTecOTP() {
    print("Second text field: ${tecOTP.value}");
  }

  final boxDecorationFocusSelulerOTP = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.cyan[700],
      shape: BoxShape.rectangle);
  final boxDecorationSeluler = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.cyan[600],
      shape: BoxShape.rectangle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white)
            ),
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            /// LABEL SMS akan terkirim
            Container(
                child: Text(
                    'SMS akan terkirim ke hp Anda dalam 30 detik',
                    style: TextStyle(
                        fontSize: 12, color: Colors.white)),
                margin: EdgeInsets.fromLTRB(20, 0, 40, 20),
                alignment: Alignment.topLeft
            ),

            /// ROW LABEL DAN TF NO TEL SELULER, OTP
            Container(
              child: Row(children: <Widget>[
                /// LABEL NOMOR
                Column(children: <Widget>[
                  Text(
                      'Nomor telepon seluler',
                      style: TextStyle(color: Colors.white, fontSize: 14)
                  ),

                  /// TEXTFIELD NOMOR
                  Container(
                      child: GestureDetector(
                        child: Focus(
                          child: TextField(
                            controller: tecSeluler,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '0821 1234 5678',
                                hintStyle: TextStyle(color: Colors.white70),
                                isDense: true,
                                suffixIcon: IconButton(
                                    onPressed: () => tecSeluler.clear(),
                                    icon: Icon(Icons.clear, color: Colors.white60)
                                )
                            ),
                            onChanged: (String s) {},
                            readOnly: true,
                            showCursor: true,
                            style: isFokusSel ? TextStyle(color: Colors.white) :
                            TextStyle(color: Colors.white70),
                            textAlign: TextAlign.justify,
                          ),
                          onFocusChange: (punyaFokus) {
                            setState(() {
                              isFokusSel = punyaFokus;
                              print('onFocusChange setState SELULER = $isFokusSel');
                            });
                          },
                        ),
                        onTap: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          print('onTap click is working!');
                        },
                      ),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 250,
                      decoration: isFokusSel ? boxDecorationFocusSelulerOTP :
                          boxDecorationSeluler
                  ),
                ],
                    crossAxisAlignment: CrossAxisAlignment.start// rata kiri
                ),

                /// jarak antara no telp sel dan otp
                Column(children: <Widget>[Container(width: 25)]),

                /// LABEL PASSWORD
                Column(children: <Widget>[
                  Container(height: 2),

                  Text(
                      'Kode OTP salah',
                      style: TextStyle(color: Colors.white, fontSize: 11)
                  ),

                  /// TEXTFIELD PASSWORD
                  Container(
                      child: GestureDetector(
                        child: Focus(
                          child: TextField(
                            controller: tecOTP,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(22, 15, 0, 0),
                              border: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: '0000',
                              hintStyle: TextStyle(color: Colors.white70),
                              isDense: true,
                            ),
                            // maxLength: 4,
                            onChanged: (String s) {},
                            readOnly: true,
                            showCursor: true,
                            style: isFokusOtp ? TextStyle(color: Colors.white) :
                            TextStyle(color: Colors.white70),
                            textAlign: TextAlign.justify,
                          ),
                          onFocusChange: (isFocus) {
                            setState(() {
                              isFokusOtp = isFocus;
                              print('onFocusChange setState OTP = $isFokusOtp');
                            });
                          },
                        ),
                        onTap: () {
                          print('onTap click is working!');
                        },
                      ),
                      height: 48,///NAPA NI HRS PAKE HEIGHT GA KYK NO TELP
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: 80,
                      decoration: isFokusOtp ? boxDecorationFocusSelulerOTP :
                      boxDecorationSeluler
                  ),
                ],
                    crossAxisAlignment: CrossAxisAlignment.start
                ),
              ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
              alignment: Alignment.center,
            ),

            /// LABEL LUPA PASSWORD
            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 40, 0),
              child: RichText(
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
                textAlign: TextAlign.justify,
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
            Container(
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
                margin: EdgeInsets.fromLTRB(0, 20, 15, 0)
            ),

            /// CALCULATOR BUTTONS
            Expanded(
                child: Container(
                  ///0,50,0,0
                  height: MediaQuery.of(context).size.height * .35,
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
                                      child: Icon(
                                          Icons.backspace,
                                          color: Colors.white,
                                          size: 28)
                                  )
                              )
                          ),
                        ],
                      ]
                    ),
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                )
            )
          ]),

          padding: const EdgeInsets.all(5.0),
          color: Colors.cyan,
        ),
    );
  }
}