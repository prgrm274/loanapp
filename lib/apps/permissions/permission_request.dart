import 'package:flutter/material.dart';

class PermissionRequest extends StatefulWidget {
  PermissionRequest({Key key}) : super(key: key);

  @override
  _PermissionRequestState createState() => _PermissionRequestState();
}

class _PermissionRequestState extends State<PermissionRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        /// ROW UTAMA
        child: Container(
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /// ROW 1
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('Selamat datang', style: TextStyle(
                          backgroundColor: Colors.amber
                        ),),
                      ]
                  ),
                  /// ROW 2
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('Text icon dan permission', style: TextStyle(
                            backgroundColor: Colors.red
                        ),),
                      ]
                  ),
                  /// ROW 3
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('text dan button terima', style: TextStyle(
                            backgroundColor: Colors.green
                        ),)
                      ]
                  ),
                ]
            ),
          ),
        )
      )
    );
  }
}
