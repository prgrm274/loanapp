import 'package:flutter/material.dart';

class TanyaJawab3 extends StatefulWidget {
  TanyaJawab3({Key key}) : super(key: key);

  @override
  _TanyaJawab3State createState() =>
      _TanyaJawab3State();
}

class _TanyaJawab3State extends State<TanyaJawab3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Siapa yang dapat menggunakan layanan pinjaman DanaFix?'
            '- Nasabah dengan umur 22 tahun - 60 tahun'
            '- Minimal penghasilan perbulan Rp (clickable contact number 2.000.000),-'
            '- Bertempat tinggal dan bekerja di Indonesia'
      ),
    );
  }
}