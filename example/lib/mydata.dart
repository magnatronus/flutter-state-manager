import 'package:flutter/material.dart';

class MyData  extends ChangeNotifier{

  // an internal counter
  int _count = 0;

  // increment the counter
  void increment() {
    _count++;
    notifyListeners();
  }

  // get the current count value
  int get countValue {
    return _count;
  }

}