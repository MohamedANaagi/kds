import 'package:flutter/material.dart';

class ValueProvider with ChangeNotifier {
  int _value = 0;

  int get value => _value;

  void setValue(int newValue) {
    _value = newValue;
    notifyListeners();
  }
}
