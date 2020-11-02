import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          /// NG
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /// BRS LOGO
            Row(children: <Widget>[
              /// ALIGN NG
              Align(
                alignment: Alignment.topLeft,
                child: Image(
                  image: AssetImage('lib/assets/ojk_transparent.png'),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 110,
                  height: 100,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Image(
                  height: 75,
                  width: 150,
                  image: AssetImage('lib/assets/dfix_transparent.png'),
                ),
              ),
            ]),
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8, 40, 8, 0),
                height: 200,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 3, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: ListView(
                  children: <Widget>[
                    Text(
                      'Anda terima',
                    ),
                    Text(
                      'Anda terima',
                    ),
                  ]
                )
              ),
            ]),
          ]),
    );
  }
}
