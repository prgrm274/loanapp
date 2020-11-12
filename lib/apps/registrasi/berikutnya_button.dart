import 'package:flutter/material.dart';

class Reg060BerikutnyaButton extends StatefulWidget {
  Reg060BerikutnyaButton({Key key}) : super(key: key);

  @override
  _Reg060BerikutnyaButtonState createState() => _Reg060BerikutnyaButtonState();
}

class _Reg060BerikutnyaButtonState extends State<Reg060BerikutnyaButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 50, 15, 20),
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
          onPressed: () {},
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