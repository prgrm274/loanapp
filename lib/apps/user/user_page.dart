import 'package:flutter/material.dart';
import 'package:voidrealm/drawers/drawer2.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer2(),
        key: _drawerKey,
        appBar: AppBar(
          elevation: 0.0,
          titleSpacing: 10.0,
          backgroundColor: Colors.cyan,
          title: Text('Nama Lengkap'),
          leading: InkWell(
            onTap: () {
              _drawerKey.currentState.openDrawer();
            },
            splashColor: Colors.red,
            child: new Container(
                padding: const EdgeInsets.fromLTRB(12.0, 16.0, 16.0, 16.0),
                child: Icon(
                    Icons.menu,
                    color: Colors.black26
                )
            ),
          ),
        ),
        body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.red,
                      width: 2
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Text(
                                    'Pinjaman Rp 1.500.000',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  width: MediaQuery.of(context).size.width * 1,
                                  child: Text(
                                    'Mohon maaf pengajuan Anda belum dapat kami setujui. '
                                        'Anda bisa ajukan ulang dalam satu minggu setelah pengajuan sebelumnya',
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ]
                          )
                      ),
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(48, 186, 197, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                            children: <Widget>[
                              Container(
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Image(
                                    image: AssetImage('lib/assets/promo_card_faq.png')
                                ),
                              ),
                            ]
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  'Bagaimana saya bisa mendapat pinjaman baru?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  'Bagaimana saya bisa mendapatkan uang saya?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  'Bagaimana cara memperpanjang pinjaman?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ]
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[200],
                      width: 2
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 1,
                                child: Text(
                                  'Ingin mengetahui promo pinjaman?\nJoin Facebook group kami',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: Color.fromRGBO(59, 89, 152, 1),
                                ),
                                height: 50,
                                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                    children: <Widget>[
                                      Container(
                                        color: Colors.white,
                                        child: Image(
                                            height: 24,
                                            image: AssetImage('lib/assets/fesbuk_from_skrinsut.png')
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(70, 0, 10, 0),
                                        child: Text(
                                          'Join Facebook group kami',
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ]
                                ),
                              ),
                            ]
                        ),
                      )
                    ]
                ),
              ),
            ]
        ),
      ),
    );
  }
}