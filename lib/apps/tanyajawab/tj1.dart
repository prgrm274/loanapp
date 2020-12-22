import 'package:flutter/material.dart';

class TanyaJawab1 extends StatefulWidget {
  TanyaJawab1({Key key}) : super(key: key);

  @override
  _TanyaJawab1State createState() => _TanyaJawab1State();
}

class _TanyaJawab1State extends State<TanyaJawab1> {
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
                        'PERNYATAAN PENYANGKALAN (DISCLAIMER)',
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
                        '- 1.	Layanan Pinjam Meminjam Berbasis Teknologi Informasi merupakan '
                            'kesepakatan perdata antara Pemberi Pinjaman dengan Penerima '
                            'Pinjaman, sehingga segala risiko yang timbul dari kesepakatan '
                            'tersebut ditanggung sepenuhnya oleh masing-masing pihak.\n'
                            '- 2. Risiko kredit atau gagal bayar ditanggung sepenuhnya oleh '
                            'Pemberi Pinjaman. Tidak ada lembaga atau otoritas negara yang '
                            'bertanggung jawab atas risiko gagal bayar ini.\n'
                            '- 3. Penyelenggara dengan persetujuan dari masing-masing Pengguna '
                            '(Pemberi Pinjaman dan/atau Penerima Pinjaman) mengakses, '
                            'memperoleh, menyimpan, mengelola dan/atau menggunakan data '
                            'pribadi Pengguna ("Pemanfaatan Data") pada atau di dalam benda, '
                            'perangkat elektronik (termasuk smartphone atau telepon seluler), '
                            'perangkat keras (hardware) maupun lunak (software), dokumen '
                            'elektronik, aplikasi atau sistem elektronik milik Pengguna atau '
                            'yang dikuasai Pengguna, dengan memberitahukan tujuan, batasan '
                            'dan mekanisme Pemanfaatan Data tersebut kepada Pengguna yang '
                            'bersangkutan sebelum memperoleh persetujuan yang dimaksud.\n'
                            '- 4.	Pemberi Pinjaman yang belum memiliki pengetahuan dan '
                            'pengalaman pinjam meminjam, disarankan untuk tidak menggunakan '
                            'layanan ini\n'
                            '- 5.	Penerima Pinjaman harus mempertimbangkan tingkat bunga pinjaman '
                            'dan biaya lainnya sesuai dengan kemampuan dalam melunasi pinjaman\n'
                            '- 6.	Setiap kecurangan tercatat secara digital di dunia maya dan '
                            'dapat diketahui masyarakat luas di media sosial\n'
                            '- 7.	Pengguna harus membaca dan memahami informasi ini sebelum '
                            'membuat keputusan menjadi Pemberi Pinjaman atau Penerima Pinjaman\n'
                            '- 8.	Pemerintah yaitu dalam hal ini Otoritas Jasa Keuangan, tidak '
                            'bertanggung jawab atas setiap pelanggaran atau ketidakpatuhan oleh '
                            'Pengguna, baik Pemberi Pinjaman maupun Penerima Pinjaman (baik karena '
                            'kesengajaan atau kelalaian Pengguna) terhadap ketentuan '
                            'peraturan perundang-undangan maupun kesepakatan atau perikatan '
                            'antara Penyelenggara dengan Pemberi Pinjaman dan/atau Penerima Pinjaman.\n'
                            '- 9.	Setiap transaksi dan kegiatan pinjam meminjam atau pelaksanaan '
                            'kesepakatan mengenai pinjam meminjam antara atau yang melibatkan '
                            'Penyelenggara, Pemberi Pinjaman dan/atau Penerima Pinjaman wajib dilakukan '
                            'melalui escrow account dan virtual account sebagaimana yang diwajibkan '
                            'berdasarkan Peraturan Otoritas Jasa Keuangan Nomor 77/POJK.01/2016 tentang '
                            'Layanan Pinjam Meminjam Uang Berbasis Teknologi Informasi dan '
                            'pelanggaran atau ketidakpatuhan terhadap ketentuan tersebut '
                            'merupakan bukti telah terjadinya pelanggaran hukum oleh '
                            'Penyelenggara sehingga Penyelenggara wajib menanggung ganti '
                            'rugi yang diderita oleh masingmasing Pengguna sebagai akibat '
                            'langsung dari pelanggaran hukum tersebut di atas tanpa '
                            'mengurangi hak Pengguna yang menderita kerugian menurut Kitab '
                            'Undang-Undang Hukum Perdata.'
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
                        color: Colors.grey[300],
                      ),
                      padding: EdgeInsets.all(10)
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