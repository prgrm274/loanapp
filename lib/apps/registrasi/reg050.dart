import 'package:flutter/material.dart';

class Reg050 extends StatefulWidget {
  Reg050({Key key}) : super(key: key);

  @override
  _Reg050State createState() => _Reg050State();
}

class _Reg050State extends State<Reg050> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        // height: MediaQuery.of(context).size.height * 1,
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            color: Colors.grey[100],
            child: Row(children: <Widget>[
              Expanded(
                child: Text('Saya terima\nRp 1.500.000'),
              ),
              Expanded(
                child: Text('Nilai angsuran\nRp 525.000'),
              ),
              Expanded(
                child: Text('Bayar pertama\n27.10.2020'),
              ),
            ]),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[

                Row(children: <Widget>[
                  Container(
                    child: Text('Nama lengkap sesuai KTP',
                    style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.grey,
                      ),
                      // margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                      child: TextField(
                        // controller: tecHape,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          focusColor: Colors.yellow,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Dian Permata Fransiska',
                          hintStyle: TextStyle(
                              color: Colors.blue
                          ),
                          suffixIcon: IconButton(
                            // onPressed: () => tecHape.clear(),
                            icon: Icon(Icons.clear),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                Row(children: <Widget>[
                  Container(
                    child: Text('Tanggal lahir',
                    style: TextStyle(
                      color: Colors.grey,
                    ),),
                  ),
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                        shape: BoxShape.rectangle
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '24.05.1986',
                        ),
                      ),
                    ),
                  ),
                ]),
              ]),
            ),
          )
        ]));
  }
}
