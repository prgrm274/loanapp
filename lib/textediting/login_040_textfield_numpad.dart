import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';
import 'package:voidrealm/numpads/flutter_numpad_widget_example.dart';
import 'package:voidrealm/numpads/custom_numpad2.dart';
import 'package:voidrealm/numpads/pinpad/numpad.dart';
import 'package:voidrealm/numpads/pinpad/numpad_controller.dart';

class Login040 extends StatefulWidget {
  Login040({Key key}) : super(key: key);

  @override
  _Login040State createState() => _Login040State();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _Login040State extends State<Login040> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final tecHape = TextEditingController();
  final tecPasw = TextEditingController();
  // final tecHape = NumpadOnlyExample();
  // final tecPasw = CustomNumpad2();

  final numpad = NumPad();
  final numpadController = NumPadController();
  // final numpadKeyboard = NumPadKeyboard();

  @override
  void initState() {
    super.initState();
    ///V
    // tecHape.addListener(_printLatestValue);
    // tecPasw.addListener(_printLatestValue2);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    tecHape.dispose();
    tecPasw.dispose();
    super.dispose();
  }

  _printLatestValue() {///V
    print("First text field: ${tecHape.text}");
  }

  _printLatestValue2() {///V
    print("Second text field: ${tecPasw.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0, // for elevation
        titleSpacing: 10.0,
        backgroundColor: Colors.cyan,
        title: Text('Masuk'),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();

            // Navigator.pop(context);// 2020
          },
          splashColor: Colors.red,
          // splashColor: UniQueryColors.colorGradientEnd.withOpacity(.5),
          child: new Container(/// kotaknya navigation icon
            // color: Colors.red,
              padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
              // child: Image(image: AssetImage('lib/assets/grey_arrow_white.png'))
            child: Icon(Icons.arrow_back_rounded, color: Colors.white,)
            // child: UtilCommonWidget.addImage(Constant.iconBack, 19.0, 10.0))
          ),
        ),
      ),
      body: Focus(
        onFocusChange: (punyaFokus) {

        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(5.0),
            color: Colors.cyan,
            child: Column(
              children: <Widget>[
                /// NOMOR HP
                Container(
                  margin: EdgeInsets.fromLTRB(40, 100, 40, 20),
                  alignment: Alignment.topLeft,
                  // color: Colors.blue,
                  child: Text('Nomor hp', style: TextStyle(
                      fontSize: 18, color: Colors.white)),
                  // child: TextField(
                  //   onChanged: (text) {
                  //     print("First text field: $text");
                  //   },
                  // ),
                ),
                /// TEXTFIELD NOMOR
                Container(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                    child: GestureDetector(
                      onTap: (){
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        print('onTap click is working!');
                      },
                      child: TextField(
                        onChanged: (String s) {
                          // final val = TextSelection.collapsed(offset: tecHape.text.length);
                          // tecHape.selection = val;
                        },
                        /// THE INPUT FORMAT FOR THE KEYBOARD
                        // keyboardType: TextInputType.number,//text, email, phone

                        /// HIDE THE KEYBOARD
                        readOnly: true,
                        showCursor: true,
                        // onTap: (){
                        //   NumPad(controller: numpadController);
                        // },
                        decoration: InputDecoration(
                          /// suffixIcon: Icon(Icons.cancel),
                          suffixIcon: IconButton(
                              onPressed: () => tecHape.clear(),
                              icon: Icon(Icons.clear, color: Colors.white60)),
                          hintText: '08',
                          hintStyle: TextStyle(color: Colors.white70),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white60, width: 1),
                              borderRadius: BorderRadius.circular(4.2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(4.2)),
                        ),
                        controller: tecHape,
                      ),
                    )
                ),

                /// TEXTFIELD PASSWORD
                Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: TextField(
                    controller: tecPasw,
                    readOnly: true,
                    showCursor: true,

                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => tecPasw.clear(),
                        icon: Icon(Icons.clear, color: Colors.white60,),
                      ),
                      hintText: 'Kata kunci',
                      hintStyle: TextStyle(
                          color: Colors.white70
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white60,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(4.2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(4.2),
                      ),
                    ),
                  ),
                ),

                /// LABEL LUPA PASSWORD
                Container(
                  margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                  child: Linkify(
                    text: 'Saya tidak tahu password saya',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
                ),

                /// before
                /// NUMPAD
                // Container(
                //   height: 200,
                //   // child: CustomNumpad2(),
                //   child: FlutterNumpadWidgetExample())

                /// BUTTON MASUK
                Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 15, 0),
                    child: Align(
                      alignment: FractionalOffset.centerRight,
                      child: RaisedButton(
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Reg050()),
                            );
                          },
                          textColor: Colors.white60,
                          color: Colors.cyan[400],
                          child: Text('MASUK'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              side: BorderSide(color: Colors.cyan))))
                ),

                /// GRID BUTTONS
                Expanded(child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),///0,50,0,0
                  height: MediaQuery.of(context).size.height * .35,
                  child: GridButton(
                      onPressed: (dynamic val) {
                        /// SNACKBAR POPUP
                        // Scaffold.of(context).showSnackBar(
                        //     SnackBar(
                        //       /// SHOWS TITLE OF GRIDBUTTONITEM
                        //         content: Text(val.toString()),
                        //         duration: Duration(milliseconds: 400)));


                        /// SET TO TEXT FIELD
                        /// NG V
                        tecHape.text = tecHape.text + val.toString();


                        /// THEN PUT CURSOR TO END AFTER EACH PRESSING BUTTON V
                        String s = tecHape.text;
                        final seleksi = TextSelection.collapsed(offset: s.length);
                        tecHape.selection = seleksi;

                        print(tecHape.text);


                        // if (val.toString() == tecHape.text + 'x') {/// X
                        if (tecHape.text.contains('x')) {
                          /// HANDLING BACKSPACE NG CUMA NAMPILIN HURUF TERAKHIR
                          print(tecHape.text.toString().substring(tecHape.text.length-1));
                        }

                        /// BY CUSTOM VARIABLE
                      },
                      hideSurroundingBorder: true,
                      borderColor: Colors.transparent,
                      items: [
                        [
                          GridButtonItem(title: '1', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                            // value: (dynamic v) {
                            //   Fluttertoast.showToast(msg: '1', toastLength: Toast.LENGTH_SHORT);
                            // },
                            value: 1,
                            child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white, width: 1.0))),
                                child: Align(
                                    alignment: FractionalOffset.center,
                                    /// PRIORITAS TEXT MELEBIHI GRIDBUTTONITEM TITLE
                                    child: Text('1', style: TextStyle(
                                        color: Colors.white, fontSize: 24)))),
                          ),

                          // GridButtonItem(
                          //     child: RaisedButton(
                          //         onPressed: (){
                          //           Fluttertoast.showToast(msg: '1', toastLength: Toast.LENGTH_SHORT);
                          //         }),
                          //     title: '1'),

                          GridButtonItem(title: '2', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('2', style: TextStyle(
                                          color: Colors.white, fontSize: 24)))),
                              value: '2',
                              longPressValue: 'long'
                          ),
                          GridButtonItem(title: '3', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('3', style: TextStyle(
                                          color: Colors.white, fontSize: 24))
                                  )
                              ),
                              value: '3', longPressValue: 'long'
                          ),

                          /// FLEX WILL MAKE IT WIDER
                          // GridButtonItem(title: 'Title 3', flex: 2),
                        ],

                        [
                          GridButtonItem(title: '4', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white,
                                          width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('4', style: TextStyle(
                                          color: Colors.white, fontSize: 24)))),
                              value: '4',
                              longPressValue: 'long'
                          ),
                          // GridButtonItem(
                          //     child: RaisedButton(
                          //         onPressed: (){
                          //           Fluttertoast.showToast(msg: '1', toastLength: Toast.LENGTH_SHORT);
                          //         }),
                          //     title: '1'),

                          GridButtonItem(title: '5', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white,
                                        width: 1.0))),
                                child: Align(
                                  alignment: FractionalOffset.center,
                                  child: Text('5', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24
                                  )),
                                ),
                              ),
                              value: '5',
                              longPressValue: 'long'
                          ),

                          GridButtonItem(title: '6', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(
                                        color: Colors.white,
                                        width: 1.0))),
                                child: Align(
                                  alignment: FractionalOffset.center,
                                  child: Text('6', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24
                                  )),
                                ),
                              ),
                              value: '6',
                              longPressValue: 'long'
                          ),

                          /// FLEX WILL MAKE IT WIDER
                          // GridButtonItem(title: 'Title 3', flex: 2),
                        ],

                        [
                          GridButtonItem(title: '7', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('7', style: TextStyle(
                                          color: Colors.white, fontSize: 24)))
                              ),
                              // value: (dynamic v) {
                              //   Fluttertoast.showToast(msg: '7', toastLength: Toast.LENGTH_SHORT);
                              // }
                              value: '7',
                              longPressValue: 'long'
                          ),

                          GridButtonItem(title: '8', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('8', style: TextStyle(
                                          color: Colors.white, fontSize: 24))
                                  )
                              ),
                              value: '8',
                              longPressValue: 'long'
                          ),

                          GridButtonItem(title: '9', textStyle: TextStyle(
                              color: Colors.white, fontSize: 24),
                              child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(
                                          color: Colors.white, width: 1.0))),
                                  child: Align(
                                      alignment: FractionalOffset.center,
                                      child: Text('9', style: TextStyle(
                                          color: Colors.white, fontSize: 24)))),
                              value: '9',
                              longPressValue: 'long'
                          ),
                          /// FLEX WILL MAKE IT WIDER
                          // GridButtonItem(title: 'Title 3', flex: 2),
                        ],

                        [
                          // backspaceItem,

                          GridButtonItem(title: ''),

                          GridButtonItem(title: '0',
                            textStyle: TextStyle(color: Colors.white, fontSize: 24),
                            value: 0,/// IF NULL, WILL USE THE TITLE
                          ),

                          GridButtonItem(child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: RaisedButton(
                                onPressed: (){
                                  tecHape.text = tecHape.text.toString().substring(0, tecHape.text.length - 1);
                                },
                                elevation: 0,
                                color: Colors.cyan,
                                child: Icon(Icons.backspace, color: Colors.white, size: 28)))
                          ),
                        ],
                      ]
                  ),
                )),

                /// GRID BUTTONS 2

              ],
            ),
          ),
        ),
      )
    );
  }
}
