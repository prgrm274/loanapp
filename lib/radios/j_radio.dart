import 'package:flutter/material.dart';

class JRadio extends StatefulWidget {
  JRadio({Key key}) : super(key: key);

  @override
  _JRadioState createState() => _JRadioState();
}

class GrupRadio {
  final int indeks;
  final String teks;

  GrupRadio({
    this.indeks,
    this.teks
  });
}

class _JRadioState extends State<JRadio> {

  int _minSatu = -1;
  String _terpilih;

  /// ng
  final List<Radio> _radioList = [
    Radio(value: 'SD', groupValue: 0, onChanged: null),
    Radio(value: 'SMP', groupValue: 1, onChanged: null),
  ];

  final List<GrupRadio> _grupRadioList = [
    GrupRadio(indeks: 1, teks: "Sekolah Dasar"),
    GrupRadio(indeks: 2, teks: "Sekolah Menengah Pertama"),
    GrupRadio(indeks: 3, teks: "Sekolah Menengah Atas"),
    GrupRadio(indeks: 4, teks: "Sarjana"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Radio"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Apa tingkat pendidikan anda?"),
            _buildRadio(),
            Text("Tingkat pendidikan anda: "),
            SizedBox(height: 8.8,),
            Center(
              child: Text(
                _terpilih == null ? "Belum memilih" : _terpilih,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  
  Widget _buildRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _grupRadioList.map((elemen) =>
          Row(
            children: <Widget>[
                  Radio(
                    value: elemen.indeks,
                    groupValue: _minSatu,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    onChanged: (value) {
                      setState(() {
                        _minSatu = value;
                        _terpilih = elemen.teks;
                      });
                    },
                  ),
                  Text(elemen.teks),
                ],
              ))
          .toList(),
    );
  }
}