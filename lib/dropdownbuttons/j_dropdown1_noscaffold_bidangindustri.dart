import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownBidangindustri extends StatefulWidget {
  DropdownBidangindustri({Key key}) : super(key: key);

  @override
  _DropdownBidangindustriState createState() => _DropdownBidangindustriState();
}

class _DropdownBidangindustriState extends State<DropdownBidangindustri> {

  List<String> _bidangindustri = [
    'Perbankan / Bid Keuangan',
    'Pemerintahan',
    'Administrasi',
    'Hukum',
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
        hint: Text('Perbankan / Bid Keuangan'),
        value: _selectedLocation,
        onChanged: (newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
        },
        items: _bidangindustri.map((s) {
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