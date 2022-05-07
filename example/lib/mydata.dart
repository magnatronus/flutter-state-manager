import 'package:flutter/material.dart';

/// An example Data and State manager class for a Flutter application
/// The example provides a simple internal counter that can be incremented with an exposed method
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

  /// Load any relevent app data here
  Future <void> loadData() async {
    // Empty but this method could be used to do an initial data load when the app is started
  } 


}