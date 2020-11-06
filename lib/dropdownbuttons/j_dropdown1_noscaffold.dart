import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown1 extends StatefulWidget {
  Dropdown1({Key key}) : super(key: key);

  @override
  _Dropdown1State createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {

  List<String> _sekolah = [
    'Sekolah Dasar (SD)',
    'Sekolah Menengah Pertama (SMP)',
    'Sekolah Menengah Atas (SMA)',
    'Universitas'
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
        hint: Text('Sekolah Dasar (SD)'),
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
    );
  }
}