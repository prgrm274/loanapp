import 'package:flutter/material.dart';
import 'package:voidrealm/apps/registrasi/reg070.dart';
import 'package:voidrealm/apps/registrasi/reg080_saudara_kontak.dart';

class Reg070Button extends StatefulWidget {
  Reg070Button({Key key}) : super(key: key);

  @override
  _Reg070ButtonState createState() => _Reg070ButtonState();
}

class _Reg070ButtonState extends State<Reg070Button> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          onPressed: () {
            /// TO REGISTRASI 080
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Reg080()),
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
    );
  }
}