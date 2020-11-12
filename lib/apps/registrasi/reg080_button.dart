import 'package:flutter/material.dart';
import 'package:voidrealm/apps/registrasi/reg070.dart';
import 'package:voidrealm/apps/registrasi/reg080_saudara_kontak.dart';

class Reg080Button extends StatefulWidget {
  Reg080Button({Key key}) : super(key: key);

  @override
  _Reg080ButtonState createState() => _Reg080ButtonState();
}

class _Reg080ButtonState extends State<Reg080Button> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
          onPressed: () {
            /// TO REGISTRASI
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
              side: BorderSide(color: Colors.cyan)),
        ),
      ),
    );
  }
}