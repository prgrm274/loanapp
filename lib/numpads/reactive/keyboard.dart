import 'package:mobx/mobx.dart';

// class ReactiveKeyboard = _ReactiveKeyboard with _$ReactiveKeyboard;

abstract class _ReactiveKeyboard with Store {

  _ReactiveKeyboard();

  @observable
  var _value;

  @computed
  get value => _value;

  setValue(value) {
    _value = value;
  }

}