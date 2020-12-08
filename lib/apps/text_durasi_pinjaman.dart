import 'package:flutter/material.dart';

class TextDurasiPinjaman extends StatefulWidget {
  TextDurasiPinjaman({Key key}) : super(key: key);

  @override
  _TextDurasiPinjamanState createState() => _TextDurasiPinjamanState();
}

class _TextDurasiPinjamanState extends State<TextDurasiPinjaman> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Durasi pinjaman, dalam satuan bulan',
      style: TextStyle(
          color: Colors.white70
      ),
    );
  }
}