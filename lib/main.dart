import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


class MyApp extends StatefulWidget {///WONT CHANGE

  _Statenya createState() => new _Statenya();
}

class _Statenya extends State<MyApp> {
  String _title = '';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.home),
                onPressed: null),
            new IconButton(
                icon: new Icon(Icons.exit_to_app),
                onPressed: null),
          ],
        ),
      ),
    );
  }
}