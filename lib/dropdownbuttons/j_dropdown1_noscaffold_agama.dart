import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownAgama extends StatefulWidget {
  DropdownAgama({Key key}) : super(key: key);

  @override
  _DropdownAgamaState createState() => _DropdownAgamaState();
}

class _DropdownAgamaState extends State<DropdownAgama> {

  List<String> _agama = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
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
          /*onTap: () {///! salah
                Navigator.of(context).pop();
              },*/
          hint: Text('Islam'),
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _agama.map((s) {
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