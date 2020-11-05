class Regex1 {
  static final alphabet = RegExp(r'^[a-zA-Z]+$');
  final alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

  static bool checkAlphabet(String text){///ng
    alphabet.hasMatch(text);
    print('Alphabet valid');
  }

  // void checkAlphabet(){
  //   alphanumeric.hasMatch('abc123');  // true
  //   alphanumeric.hasMatch('abc123%'); // false
  // }

  void checkAlphanumeric(String text){
    alphanumeric.hasMatch(text);
    print('Alphanumeric valid');
  }
}