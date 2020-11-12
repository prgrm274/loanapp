import 'dart:async';

import 'package:flutter/material.dart';
import 'package:voidrealm/apps/registrasi/reg050.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) => Reg050()
            )
        )
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.cyan, Colors.blue[400], Colors.purple[300]]),
        // border: Border.all(color: Colors.green),
        image: DecorationImage(
          // image: AssetImage('lib/assets/splash_logo.webp'),///bisa
          image: AssetImage('lib/assets/splash_logo_025.png'),
          fit: BoxFit.scaleDown,
        ),
        // shape: BoxShape.circle,
      ),
    );
  }
}
