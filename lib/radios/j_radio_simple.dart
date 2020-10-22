import 'package:flutter/material.dart';

class JRadioSimple extends StatefulWidget {
  JRadioSimple({Key key}) : super(key: key);

  @override
  _JRadioSimpleState createState() => _JRadioSimpleState();
}

enum Pendidikan {
  Sekolah_Dasar,
  Sekolah_Menengah_Pertama,
  Sekolah_Menengah_Atas,
  Kuliah
}

class _JRadioSimpleState extends State<JRadioSimple> {
  Pendidikan _pendidikan = Pendidikan.Sekolah_Dasar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Teks 1 1'),
            leading: Radio(
                value: Pendidikan.Sekolah_Dasar,
                groupValue: _pendidikan,
                onChanged: (Pendidikan value) {
                  setState(() {
                    _pendidikan = value;
                  });
                }),
          ),
          ListTile(
            title: const Text('Teks 2 di listtile 2'),
            leading: Radio(
              value: Pendidikan.Sekolah_Menengah_Pertama,
              groupValue: _pendidikan,
              onChanged: (Pendidikan value) {
                setState(() {
                  _pendidikan = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
