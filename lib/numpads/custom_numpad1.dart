import 'package:flutter/material.dart';
import 'package:flutter_numpad_widget/flutter_numpad_widget.dart';

class NumpadOnlyExample extends StatelessWidget {
  final _controller = NumpadController();

  NumpadOnlyExample() {
    this._controller.addListener(_controllerListener);
  }

  /// NG GET SET
  get numpad2text => print('get text1');

  set controller(value) {
    print(value);
  }

  void _controllerListener() {
    //Do things with the data in the controller.
  }

  @override
  Widget build(BuildContext context) {
    return Numpad(controller: _controller);
  }
}