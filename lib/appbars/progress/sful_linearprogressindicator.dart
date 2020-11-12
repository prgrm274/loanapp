import 'package:flutter/material.dart';
import 'package:voidrealm/models/appbar_model.dart';

class SfulLinearprogressindicator extends StatefulWidget {
  SfulLinearprogressindicator({Key key}) : super(key: key);

  @override
  _SfulLinearprogressindicatorState createState() =>
      _SfulLinearprogressindicatorState();
}

class _SfulLinearprogressindicatorState
    extends State<SfulLinearprogressindicator> {
  final appbarModel = List<AppbarModel>.generate(
    20,
        (i) => AppbarModel(
        'AppbarModel $i',
        'A description of what needs to be done for AppbarModel $i'
    ),
  );

  double _progres = 0;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      semanticsValue: ((){
        'Semantics value '+appbarModel.length.toString();
      }()),
      semanticsLabel: ((){
        'Semantics label '+appbarModel.length.toString();
      }()),
      backgroundColor: Colors.cyanAccent,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
      value: _progres,
    );
  }
}