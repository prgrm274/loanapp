import 'package:flutter/material.dart';

class TextSudahPeminjam extends StatefulWidget {
  TextSudahPeminjam({Key key}) : super(key: key);

  @override
  _TextSudahPeminjamState createState() => _TextSudahPeminjamState();
}

class _TextSudahPeminjamState extends State<TextSudahPeminjam> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'SUDAH MENJADI PEMINJAM',
      style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline
      ),
    );
  }
}