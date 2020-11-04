import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown1Scaffold extends StatefulWidget {
  Dropdown1Scaffold({Key key}) : super(key: key);

  @override
  _Dropdown1ScaffoldState createState() => _Dropdown1ScaffoldState();
}

class _Dropdown1ScaffoldState extends State<Dropdown1Scaffold> {

  List<String> _sekolah = [
    'Sekolah Dasar (SD)',
    'Sekolah Menengah Pertama (SMP)',
    'Sekolah Menengah Atas (SMA)',
    'Universitas'
  ];

  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: Colors.grey[200]
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            )
        ),
        child: DropdownButton(
          /*onTap: () {///! salah
                Navigator.of(context).pop();
              },*/
          hint: Text('Tingkat pendidikan'),
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
        ),
      ),
    );
  }
}