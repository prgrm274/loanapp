import 'package:flutter/material.dart';
import 'package:voidrealm/apps/registrasi/reg070.dart';

class Reg060Button extends StatefulWidget {
  Reg060Button({Key key}) : super(key: key);

  @override
  _Reg060ButtonState createState() => _Reg060ButtonState();
}

class _Reg060ButtonState extends State<Reg060Button> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          onPressed: () {
            /// TO REGISTRASI 070 PEKERJAAN
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Reg070()),
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
    );
  }
}