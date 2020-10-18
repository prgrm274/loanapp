import 'package:flutter/material.dart';
import 'package:voidrealm/helloworld.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '21 Basic Layout',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Basic Layout'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(32),

          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('array text 0'),
                new Text('array text 1'),
                new Text('array text 2'),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*new Container(
                      padding: const EdgeInsets.all(5),
                      child: new Column(
                        children: <Widget>[
                          new Text('array text 0'),
                          new Text('array text 1'),
                          new Text('array text 2'),
                        ],
                      ),
                    ),*/
                    new hello(),
                    new hello(),
                    new hello(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
