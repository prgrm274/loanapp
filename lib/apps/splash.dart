import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.green
        ),
        image: DecorationImage(
              image: AssetImage(
                  'lib/assets/splash.jpg'),
              fit: BoxFit.cover,
            ),
        // shape: BoxShape.circle,
      ),
    );
  }
}