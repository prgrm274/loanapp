import 'package:flutter/material.dart';
// import 'package:voidrealm/apps/gender/gender.dart';

enum gender {
  l, p
}

class CustomRadio extends StatefulWidget {
  gender _gender = gender.l;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

      ]
    );
  }


  @override
  State<StatefulWidget> setState() {

  }

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}