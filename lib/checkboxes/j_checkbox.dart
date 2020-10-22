import 'package:flutter/material.dart';

class JCheckbox extends StatefulWidget {
  JCheckbox({Key key}) : super(key: key);

  @override
  _JCheckboxState createState() => _JCheckboxState();
}

class _JCheckboxState extends State<JCheckbox> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(60),
      child: CheckboxListTile(
        title: Text('Checkbox 1 title Checkbox 1 title Checkbox 1 title '
            'Checkbox 1 title Checkbox 1 title Checkbox 1 title Checkbox 1 title '
            'Checkbox 1 title Checkbox 1 title Checkbox 1 title Checkbox 1 title '
            'Checkbox 1 title Checkbox 1 title Checkbox 1 title '),
        value: checkedValue,
        onChanged: (newValue) {
          setState(() {
            checkedValue = newValue;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    ));
  }
}