import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter;

  int get counter => _counter;

  set counter(int newValue) {
    _counter = newValue;
  }

  Counter(this._counter);

  void increase() {
    _counter++;
    notifyListeners();
  }

  void decrease() {
    _counter--;
    notifyListeners();
  }
}
