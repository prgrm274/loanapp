import 'package:flutter/material.dart';

class TanyaJawab5 extends StatefulWidget {
  TanyaJawab5({Key key}) : super(key: key);

  @override
  _TanyaJawab5State createState() => _TanyaJawab5State();
}

class _TanyaJawab5State extends State<TanyaJawab5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          'Dokumen apa saja yang perlu disiapkan?'
          '- Anda hanya siapkan:'
          '- nomor KTP,'
          '- kontak saudara tidak serumah,'
          '- Kontak kantor tempat Anda bekerja'
      ),
    );
  }
}