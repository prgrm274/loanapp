import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class TextField1 extends StatefulWidget {
  TextField1({Key key}) : super(key: key);

  @override
  _TextField1State createState() => _TextField1State();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _TextField1State extends State<TextField1> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final tecHape = TextEditingController();
  final tecPasw = TextEditingController();

  @override
  void initState() {
    super.initState();
    tecHape.addListener(_printLatestValue);
    tecPasw.addListener(_printLatestValue);
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
    print("Second text field: ${tecPasw.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Retrieve Text Input'),
      // ),
      body: Padding(
          padding: const EdgeInsets.all(.0),

          /// 0
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
                    child: TextField(
                      controller: tecHape,
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
                  )
                ],
              ),
            ),
          )),
    );
  }
}
