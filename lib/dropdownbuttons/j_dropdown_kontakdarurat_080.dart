import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownKontakDarurat extends StatefulWidget {
  DropdownKontakDarurat({Key key}) : super(key: key);

  @override
  _DropdownKontakDaruratState createState() => _DropdownKontakDaruratState();
}

class _DropdownKontakDaruratState extends State<DropdownKontakDarurat> {

  List<String> _pekerjaan = [
    'Kakak',
    'Adik',
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
          hint: Text(''),
          value: _selectedLocation,
          onChanged: (newValue) {
            setState(() {
              _selectedLocation = newValue;
            });
          },
          items: _pekerjaan.map((s) {
            return DropdownMenuItem(
              child: new Text(s),
              value: s,
            );
          }).toList(),
          isDense: true,
          isExpanded: true,/// supaya panah di tepi kanan
        ),
      )
    );
  }
}