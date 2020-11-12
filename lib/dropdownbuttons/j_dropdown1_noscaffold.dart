import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownPendidikanTerakhir050 extends StatefulWidget {
  DropdownPendidikanTerakhir050({Key key}) : super(key: key);

  @override
  _DropdownPendidikanTerakhir050State createState() => _DropdownPendidikanTerakhir050State();
}

class _DropdownPendidikanTerakhir050State extends State<DropdownPendidikanTerakhir050> {

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
      ),
    );
  }
}