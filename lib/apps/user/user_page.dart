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
        body: Container(

        ),
      ),
    );
  }
}