import 'package:flutter/material.dart';
import 'package:voidrealm/dropdownbuttons/j_dropdown1.dart';
import 'package:voidrealm/textediting/login_040_textfield_numpad.dart';
import 'package:voidrealm/textediting/j_textfield1_no_appbar.dart';

class Dialog1 extends StatefulWidget {
  Dialog1({Key key}) : super(key: key);

  @override
  _Dialog1State createState() => _Dialog1State();
}

class _Dialog1State extends State<Dialog1> {

  @override
  Widget build(BuildContext context) {
    /// ng coba naruh sini pengganti return, bisa
    return RaisedButton(
      onPressed: show,
    );
  }

  void show() {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (
            BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height - 80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: new TextField1NoAppbar(),

                    /// UNTUK DROPDOWN HEIGHT 60 PAS
                    // height: 60,
                    // child: new Dropdown1(),
                  ),

                  // RaisedButton(
                  //   onPressed: () {/// CUMA PRESS HASILNYA TUTUP DIALOG
                  //     Navigator.of(context).pop();
                  //   },
                  //   /**
                  //    * ! salah
                  //    */
                  //   /*onPressed: () {
                  //     _dropdown1;
                  //   },*/
                  //   child: Text(
                  //     "Save",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   color: const Color(0xFF1BC0C5),
                  // ),
                ],
              ),
            ),
          );
        });
  }
}
