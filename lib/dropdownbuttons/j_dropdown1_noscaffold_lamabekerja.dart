import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownLamabekerja extends StatefulWidget {
  DropdownLamabekerja({Key key}) : super(key: key);

  @override
  _DropdownLamabekerjaState createState() => _DropdownLamabekerjaState();
}

class _DropdownLamabekerjaState extends State<DropdownLamabekerja> {

  List<String> _lamabekerja = [
    'kurang dari 1 tahun',
    'kurang dari 2 tahun',
    '1 tahun',
    '2 tahun'
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
            hint: Text('kurang dari 1 tahun'),
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _lamabekerja.map((s) {
          return DropdownMenuItem(
            child: new Text(s),
            value: s,
          );
        }).toList(),
        isDense: true,
        isExpanded: true,

        /// supaya panah di tepi kanan
      ),
    ),);
  }
}