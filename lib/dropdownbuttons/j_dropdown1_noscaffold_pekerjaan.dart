import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownPekerjaan extends StatefulWidget {
  DropdownPekerjaan({Key key}) : super(key: key);

  @override
  _DropdownPekerjaanState createState() => _DropdownPekerjaanState();
}

class _DropdownPekerjaanState extends State<DropdownPekerjaan> {

  List<String> _pekerjaan = [
    'Pemilik bisnis',
    'Karyawan',
    'Wiraswasta',
  ];

  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: Colors.grey[200]
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )
      ),
      child: DropdownButton(
        /*onTap: () {///! salah
                Navigator.of(context).pop();
              },*/
        hint: Text('Pemilik Bisnis'),
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
    );
  }
}