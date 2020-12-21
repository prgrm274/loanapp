import 'package:flutter/material.dart';

class TanyaJawab4 extends StatefulWidget {
  TanyaJawab4({Key key}) : super(key: key);

  @override
  _TanyaJawab4State createState() =>
      _TanyaJawab4State();
}

class _TanyaJawab4State extends State<TanyaJawab4> {
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