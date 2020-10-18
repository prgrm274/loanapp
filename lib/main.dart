import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


class MyApp extends StatefulWidget {///WONT CHANGE
  @override
  _Statenya createState() => new _Statenya();
}

/**
 * This is the state of MyApp
 * where you can put widgets, anything else..
 */

///_ IS PRIVATE
class _Statenya extends State<MyApp> {///WILL CHANGE
  String _title = 'App Bar demo';
  String _myState = '';

  void _pressed(String message) {
    print(message);

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_alert),
                onPressed: (){
                  _pressed('Alert pressed');
                })
          ],
        ),
        body: new Container(
          padding: const EdgeInsets.all(32),
          child: new Center(
            child: new Text('Hai'),
          ),
        ),
      ),
    );
  }

}