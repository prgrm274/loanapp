import 'package:flutter/material.dart';

class TextJumlahPinjaman extends StatefulWidget {
  TextJumlahPinjaman({Key key}) : super(key: key);

  @override
  _TextJumlahPinjamanState createState() => _TextJumlahPinjamanState();
}

class _TextJumlahPinjamanState extends State<TextJumlahPinjaman> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Jumlah pinjaman Rp',
      style: TextStyle(
        color: Colors.white70,
        // fontSize: 12
      ),
    );
  }
}