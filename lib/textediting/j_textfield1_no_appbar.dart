import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextField1NoAppbar extends StatefulWidget {
  TextField1NoAppbar({Key key}) : super(key: key);

  @override
  _TextField1NoAppbarState createState() => _TextField1NoAppbarState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _TextField1NoAppbarState extends State<TextField1NoAppbar> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final tec = TextEditingController();

  @override
  void initState() {
    super.initState();
    tec.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    tec.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${tec.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
            TextField(
              controller: tec,
              decoration: InputDecoration(
                /// suffixIcon: Icon(Icons.cancel),
                suffixIcon: IconButton(
                  onPressed: () => tec.clear(),
                  icon: Icon(Icons.clear),
                ),
                hintText: 'nomer hape',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.2),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}