import 'package:flutter/material.dart';

class JCustomNumpad extends StatefulWidget {
  _Statenya createState() => _Statenya();
}

class _Statenya extends State<JCustomNumpad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: new Color(234),

          ///customColorDarkGrey
          border: Border(
            top: BorderSide(
                width: 2.0,
                color:
                new Color(777)

              ///customColorLightGrey
            ),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child:
        new ListView(
          children: <Widget>[
            new Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                /*children: <Widget>[
                  valueField(),
                  affirmationButton(
                      'reactive', // widget.reactiveClass,
                      widget.classType,
                      'done',
                      widget.parameter,
                      widget.pc,
                      widget.property
                  )
                ]*/
            ),
            new Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numericInputButton(1),
                  numericInputButton(2),
                  numericInputButton(3),
                ]
            ),
            new Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numericInputButton(4),
                  numericInputButton(5),
                  numericInputButton(6),
                ]
            ),
            new Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                numericInputButton(7),
                numericInputButton(8),
                numericInputButton(9),
              ],
            ),
            new Visibility(
                child:
                new Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      numericInputButton('.'),
                      numericInputButton(0),
                      // backButton()
                    ]
                ),
                // visible: widget.showDecimal
            ),
            new Visibility(
                child:
                new Row (
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // blankSpace(),
                      numericInputButton(0),
                      // backButton()
                    ]
                ),
                // visible: !widget.showDecimal
            ),
          ],
        ),
      ),
    );
  }

  numericInputButton(value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              // _appendToOutput(value);
            },
            color: new Color(040),

            ///customColorGreen
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
          ),
        ]
    );
  }

  valueField() {
    return Container(
        width: 200,
        decoration: BoxDecoration(
          color: new Color(234),

          ///customColorDarkGrey
          border: Border(
            bottom: BorderSide(
                width: 1.0,
                color: new Color(0250)),

            ///customColorLightGrey
          ),
        ),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
        child:
        new Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child:
            new Text(
              // reactiveKeyboard.value.toString(),
                'sfdsfdf',
                style: TextStyle(
                  fontSize: 28,
                  color: new Color(0250),

                  ///customColorLightGrey
                )
            )
        )
    );
  }
}