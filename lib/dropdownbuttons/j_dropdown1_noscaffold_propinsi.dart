import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownPropinsi extends StatefulWidget {
  DropdownPropinsi({Key key}) : super(key: key);

  @override
  _DropdownPropinsiState createState() => _DropdownPropinsiState();
}

class _DropdownPropinsiState extends State<DropdownPropinsi> {

  List<String> _propinsi = [
    'DKI Jakarta',
    'Jawa Timur',
    'Kalimantan Selatan',
    'Sulawesi Tenggara'
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
          hint: Text('Silahkan pilih'),
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _propinsi.map((s) {
            return DropdownMenuItem(
              child: new Text(s),
              value: s,
            );
          }).toList(),
          isDense: true,
          isExpanded: true,/// supaya panah dropdown bisa berada di tepi kanan
        ),
      ),
    );
  }
}