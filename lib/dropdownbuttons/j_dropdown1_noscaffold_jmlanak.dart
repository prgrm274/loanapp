import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown1JmlAnak extends StatefulWidget {
  Dropdown1JmlAnak({Key key}) : super(key: key);

  @override
  _Dropdown1JmlAnakState createState() => _Dropdown1JmlAnakState();
}

class _Dropdown1JmlAnakState extends State<Dropdown1JmlAnak> {
  List<String> _sekolah = [
    '0',
    '1',
    '2',
    '>2'
  ];

  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Colors.grey[200]
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: Text('0'),
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _sekolah.map((s) {
            return DropdownMenuItem(
              child: new Text(s),
              value: s,
            );
          }).toList(),
          isDense: true,
          isExpanded: true,/// supaya panah di tepi kanan
        ),
      ),
    );
  }
}