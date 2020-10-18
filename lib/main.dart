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
  String _myState = 'NO STATE';

  void _pressed(String message) {
    setState(() {
      _myState = message;
    });
    // _myState = message;///! WRONG
    print(_myState);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            /// Everything is a widget so you can do this text
            new Text('this is text'),
            new IconButton(
                icon: new Icon(Icons.add_alert),
                onPressed: (){
                  _pressed('Alert pressed');
                }),
            new IconButton(
                icon: new Icon(Icons.access_alarm),
                onPressed: (){
                  _pressed('2');
                }),
            new IconButton(
                icon: new Icon(Icons.access_alarms_rounded),
                onPressed: (){
                  _pressed('other');
                }),
            new RaisedButton(
              child: new Text('Button'),
              onPressed: () {
                _pressed('BUTTON PRESSED');
              },
            )
          ],
        ),
        body: new Container(
          padding: const EdgeInsets.all(32),
          child: new Center(
            child: new Text(_myState),
          ),
        ),
      ),
    );
  }

}