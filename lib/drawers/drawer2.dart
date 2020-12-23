import 'package:flutter/material.dart';

class Drawer2 extends StatefulWidget {
  Drawer2({Key key}) : super(key: key);

  @override
  _Drawer2State createState() => _Drawer2State();
}

class _Drawer2State extends State<Drawer2> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("lib/assets/image.jpg"),
                        fit: BoxFit.cover)),
                child: Text("Gambar mobil dan danafix"),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(children: [
              ListTile(
                title: Text("Tanya Jawab"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Hubungi kami!"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Ganti password Anda"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Keluar"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
