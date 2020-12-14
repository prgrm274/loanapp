import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';

class LogoOjk extends StatefulWidget {
  LogoOjk({Key key}) : super(key: key);

  @override
  _LogoOjkState createState() => _LogoOjkState();
}

class _LogoOjkState extends State<LogoOjk> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 20,
      child: GestureDetector(
        onTap: (){
          Toast.show("onTap gesture detector\nojk_transparent", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        },
        child: Image(
          height: 50,
          width: 125,
          image: AssetImage('lib/assets/ojk_transparent.png'),
        ),
      ),
    );
  }
}