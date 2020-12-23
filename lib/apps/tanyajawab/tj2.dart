import 'package:flutter/material.dart';

class TanyaJawab2 extends StatefulWidget {
  TanyaJawab2({Key key}) : super(key: key);

  @override
  _TanyaJawab2State createState() =>
      _TanyaJawab2State();
}

class _TanyaJawab2State extends State<TanyaJawab2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Pertanyaan'),
          titleSpacing: 10.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            splashColor: Colors.red,
            child: new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white
                )
            ),
          ),
        ),
        body: Container(
          child: LayoutBuilder(
            builder: (BuildContext ctx, BoxConstraints constraints) {
              return ListView(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey[400]
                          )
                      ),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                        'Apa produk Danafix?',
                        style: TextStyle(color: Colors.grey[400])
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1, color: Colors.grey[400]
                          )
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                        '- Karakteristik Bisnis Layanan Pinjam Meminjam Berbasis Teknologi '
                            'Informasi (Umum):\n'
                            '- 1. Proses Pinjaman: online\n'
                            '- 2. Dokumen: sesuai kebutuhan\n'
                            '- 3. Jaminan: tidak tersedia\n'
                            '- 4. Lama Proses: online-10 jam\n'
                            '- 5. Proses Penagihan: online\n'
                            '- 6. Proses Pelunasan: online (melalui escrow)\n'
                            '- Karakteristik Bisnis Layanan Pinjam Meminjam Berbasis Teknologi '
                            'Informasi (Produk 1):\n'
                            '- 1. Tenor Pinjaman: 10-30 hari\n'
                            '- 2. Jumlah Pinjaman:Rp. 500.000,- sampai Rp.2.000.000,-\n'
                            '- 3. Biaya\n'
                            '- 3.1. Biaya platform:Rp. 0\n'
                            '- 3.2. Biaya Pemberi Pinjaman: Rp. 0\n'
                            '- 3.3. Biaya keterlambatan pembayaran (kepada Pemberi Pinjaman): Rp. 100.000,-\n'
                            '- 3.4. Total biaya untuk Konsumen (tidak diperpanjang):0%\n'
                            '- 3.5. Total biaya untuk Konsumen (diperpanjang): 15% per bulan\n'
                            '- Karakteristik Bisnis Layanan Pinjam Meminjam Berbasis Teknologi '
                            'Informasi (Produk 2):\n'
                            '- 1. Tenor Pinjaman: 61-180 hari\n'
                            '- 2. Jumlah Pinjaman:Rp. 500.000,- sampai Rp.6.000.000,-\n'
                            '- 3. Biaya\n'
                            '- 3.1. Biaya platform:Rp. 3% per bulan (dikurangi sebagai Biaya)\n'
                            '- 3.2. Biaya Pemberi Pinjaman: Rp. 12% per bulan(dikurangi sebagai Biaya)\n'
                            '- 3.3. Biaya keterlambatan pembayaran (kepada Pemberi Pinjaman): Rp 100.000,-\n'
                            '- 3.4. Total biaya untuk Konsumen: 15% per bulan\n'
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}