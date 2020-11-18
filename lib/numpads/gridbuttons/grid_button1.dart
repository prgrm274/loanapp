import 'package:flutter/material.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

class GridButton1 extends StatefulWidget {
  GridButton1({Key key}) : super(key: key);

  @override
  _GridButton1State createState() => _GridButton1State();
}

class _GridButton1State extends State<GridButton1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(color: Colors.green,
        child: GridButton(
            hideSurroundingBorder: true,
            items: [
              [
                GridButtonItem(title: '1'),
                GridButtonItem(title: '2', child: Text('Text 2')),
                GridButtonItem(title: '3', flex: 2),
              ],
              [
                GridButtonItem(title: '4'),
                GridButtonItem(
                    title: '5',
                    child: Text('Text 5')),
                GridButtonItem(title: '6', flex: 2),
              ],
              [
                GridButtonItem(title: '7', value: '100', longPressValue: 'long'),
                GridButtonItem(
                    title: '8',
                    color: Colors.deepPurple,
                    child: Text('Text 8')),
                GridButtonItem(title: '9', flex: 4),
              ],
            ]),
      ));
  }
}