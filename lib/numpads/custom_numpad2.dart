import 'package:flutter/material.dart';

//MOBX integration
import 'package:flutter_mobx/flutter_mobx.dart';

// import '../numpads/reactive/keyboard.dart';
// final reactiveKeyboard = ReactiveKeyboard();

var output;

getCustomKeyboard(
    reactiveClass, classType, _pc, value, parameter, showDecimal, property) {
  output = value.toString();
  // reactiveKeyboard.setValue(value);

  return CustomNumpad2(
      // reactiveClass: reactiveClass,
      classType: classType,
      pc: _pc,
      value: value,
      parameter: parameter,
      showDecimal: showDecimal,
      property: property);
}

/// aslinya WidgetCustomKeyboard
class CustomNumpad2 extends StatefulWidget {
  // final reactiveClass;
  final classType;
  final pc;
  final value;
  final parameter;
  final showDecimal;
  final property;

  CustomNumpad2({
    Key key,
    // @required this.reactiveClass,
    this.classType,
    this.pc,
    this.value,
    this.parameter,
    this.showDecimal,
    this.property,
  }) : super(key: key);

  _CustomNumpad2State createState() => _CustomNumpad2State();
}

class _CustomNumpad2State extends State<CustomNumpad2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: new Color(234),

          ///customColorDarkGrey
          border: Border(
            top: BorderSide(width: 2.0, color: new Color(777)

                ///customColorLightGrey
                ),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: new ListView(
          children: <Widget>[
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  valueField(),
                  affirmationButton(
                      'reactive', // widget.reactiveClass,
                      widget.classType,
                      'done',
                      widget.parameter,
                      widget.pc,
                      widget.property)
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numericInputButton(1),
                  numericInputButton(2),
                  numericInputButton(3),
                ]),
            new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  numericInputButton(4),
                  numericInputButton(5),
                  numericInputButton(6),
                ]),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                numericInputButton(7),
                numericInputButton(8),
                numericInputButton(9),
              ],
            ),
            new Visibility(
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      numericInputButton('.'),
                      numericInputButton(0),
                      backButton()
                    ]),
                visible: widget.showDecimal),
            new Visibility(
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      blankSpace(),
                      numericInputButton(0),
                      backButton()
                    ]),
                visible: !widget.showDecimal),
          ]),
      ),
      /*Observer(
            builder: (_) {
              return Container diatas ();
            }
        )*/
    );
  }

  _appendToOutput(value) {
    if (this.mounted) {
      this.setState(() {
        output = output == '' ? value.toString() : output + value.toString();
      });
    }
    // reactiveKeyboard.setValue(output);
  }

  _removeFromOutput() {
    if (this.mounted) {
      this.setState(() {
        output = output.substring(0, output.length - 1);
      });
    }
    // reactiveKeyboard.setValue(output);
  }

  valueField() {
    return Container(
        width: 200,
        decoration: BoxDecoration(
            color: new Color(234),

            ///customColorDarkGrey
            border: Border(
              bottom: BorderSide(width: 1.0, color: new Color(0250)),

              ///customColorLightGrey
            )),
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
        child: new Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: new Text(
                // reactiveKeyboard.value.toString(),
                'sfdsfdf',
                style: TextStyle(
                  fontSize: 28,
                  color: new Color(0250),

                  ///customColorLightGrey
                ))));
  }

  numericInputButton(value) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _appendToOutput(value);
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ]);
  }

  blankSpace() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            color: new Color(234),

            ///customColorDarkGrey
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(''),
            ),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ]);
  }

  backButton() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _removeFromOutput();
            },
            color: new Color(777),

            ///customColorLightGrey
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Icon(Icons.backspace)),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ]);
  }

  affirmationButton(reactiveClass, classType, value, key, _pc, property) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: new RaisedButton(
        onPressed: () {
          //TODO: submit data to your model/database/etc
          _pc.close();
        },
        color: new Color(777),

        ///customColorLightGrey
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value.toString(),
            style: TextStyle(
                fontSize: 16,
                color: new Color(040),

                ///customColorGreen
                fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
