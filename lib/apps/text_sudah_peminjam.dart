import 'package:flutter/material.dart';
import 'package:voidrealm/apps/registrasi/reg040a_sudah_peminjam.dart';

class TextSudahPeminjam extends StatefulWidget {
  TextSudahPeminjam({Key key}) : super(key: key);

  @override
  _TextSudahPeminjamState createState() => _TextSudahPeminjamState();
}

class _TextSudahPeminjamState extends State<TextSudahPeminjam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Login040()
              )
          );
        },
        child: Text(
          'SUDAH MENJADI PEMINJAM',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            // fontSize: 12
          ),
        ),
      ),
    );
  }
}