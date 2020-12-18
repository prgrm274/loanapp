import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:voidrealm/apps/j150_tanya_jawab.dart';

class LogoDanafix extends StatefulWidget {
  LogoDanafix({Key key}) : super(key: key);

  @override
  _LogoDanafixState createState() => _LogoDanafixState();
}

class _LogoDanafixState extends State<LogoDanafix> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => J150TanyaJawab()
              )
          );
          Toast.show("onTap gesture detector\ndfix_transparent", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
        },
        child: Image(
          height: 50,
          width: 125,
          image: AssetImage('lib/assets/dfix_transparent.png'),
        ),
      ),
    );
  }
}