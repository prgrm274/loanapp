import 'package:flutter/material.dart';

class Drawer1 extends StatefulWidget {
  Drawer1({Key key}) : super(key: key);

  @override
  _Drawer1State createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Header"),
            ),
            ListTile(
              title: Text("Home"),
            )
          ],
        ),
      ),
    );
  }
}
