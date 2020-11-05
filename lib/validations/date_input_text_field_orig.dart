import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voidrealm/validations/date_validator.dart';

class DateInputTextField extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _DateInputTextFieldState();
  }
}

class _DateInputTextFieldState extends State<DateInputTextField> {
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        errorText: DateHelper.isValidDateBirth(_textController.text.toString(), 'dd/MM/yyyy') ?
        null :  'Masukkan data dengan benar',
        errorStyle: TextStyle(
          color: Colors.redAccent,
          backgroundColor: Colors.redAccent
        )
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      inputFormatters: [DateTextFormatter()],
      onChanged: (String value) {
        if (DateHelper.isValidDateBirth(value, 'dd/MM/yyyy')) {
          print('True');
        } else {
          print('False');
        }
        setState(() {

        });
      },
      // onChanged: (String value) {},
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue) {

    //this fixes backspace bug
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeperators(newValue.text, '/');
    return newValue.copyWith(text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeperators(String value, String seperator) {
    value = value.replaceAll('/', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += seperator;
      }
      if (i == 3) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}