import 'package:flutter/material.dart';

class TextJumlahPinjamanRp extends StatefulWidget {
  TextJumlahPinjamanRp({Key key}) : super(key: key);

  @override
  _TextJumlahPinjamanRpState createState() => _TextJumlahPinjamanRpState();
}

class _TextJumlahPinjamanRpState extends State<TextJumlahPinjamanRp> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Jumlah pinjaman Rp',
      style: TextStyle(
          color: Colors.white70,
          fontSize: 12
      ),
    );
  }
}