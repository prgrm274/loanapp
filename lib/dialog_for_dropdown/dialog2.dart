import 'package:flutter/material.dart';

class Dialog2 extends StatefulWidget {
  Dialog2({Key key}) : super(key: key);

  @override
  _Dialog2State createState() => _Dialog2State();
}

class _Dialog2State extends State<Dialog2> {
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
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }
}
