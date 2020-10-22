import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Jntff extends StatefulWidget {
  Jntff({Key key}) : super(key: key);

  @override
  _JntffState createState() => _JntffState();
}

class _JntffState extends State<Jntff> {
  final _formKey = GlobalKey<FormState>();
  final tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
                controller: tec,
                decoration: InputDecoration(
                  /// suffixIcon: Icon(Icons.cancel),
                  suffixIcon: IconButton(
                    onPressed: () {
                      tec.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                  hintText: 'nomer hape',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.5),
                  )
                ),

                validator: (value) {
                  /// validation logic
                  return value.contains('@') ? 'Do not use the @ char.' : null;
                }),

            Padding(padding: EdgeInsets.all(10)),

            RaisedButton(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.white60)
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  /// text is valid
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
        key: _formKey,
      ),
    ));
  }
}
