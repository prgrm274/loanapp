import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
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
  // final tecHape = NumpadOnlyExample();
  final tecHape = TextEditingController();
  // final tecPasw = CustomNumpad2();
  final tecPasw = TextEditingController();

  final numpad = NumPad();
  // final numpadKeyboard = NumPadKeyboard();
  final numpadController = NumPadController();

  @override
  void initState() {
    super.initState();
    tecHape.addListener(_printLatestValue);
    tecPasw.addListener(_printLatestValue2);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    tecHape.dispose();
    tecPasw.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("First text field: ${tecHape.text}");
  }

  _printLatestValue2() {
    print("Second text field: ${tecPasw.value}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Retrieve Text Input'),
      // ),
      ///
      body: Center(
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
                child: Text(
                  'Nomor hp',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
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
                    // FocusScope.of(context).requestFocus(new FocusNode());
                    // FocusScope.of(context).unfocus();

                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }

                    print('on tap click is working!');
                  },
                  child: TextField(
                    controller: tecHape,
                    // onTap: (){
                    //   NumPad(controller: numpadController);
                    // },
                    decoration: InputDecoration(
                      /// suffixIcon: Icon(Icons.cancel),
                      suffixIcon: IconButton(
                        onPressed: () => tecHape.clear(),
                        icon: Icon(Icons.clear),
                      ),
                      hintText: '08',
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
              ),
              /// TEXTFIELD PASSWORD
              Container(
                margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: TextField(
                  controller: tecPasw,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => tecPasw.clear(),
                      icon: Icon(Icons.clear),
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
              /// TEXT LUPA PASSWORD
              Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: Linkify(
                  text: 'Saya tidak tahu password saya',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              /// NUMPAD
              Container(
                height: 200,
                // child: CustomNumpad2(),
                child: FlutterNumpadWidgetExample(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
