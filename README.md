# AppManager
A simple Flutter state management system to that uses ChangeNotifier to propagate data changes and state around a Flutter application. The system comprises of just 2 parts

- the use of the **AppManager** class
- the create of a state/data class derived from a **ChangeNotifier**

**AppManager** is used to wrap the application while the derived **ChangeNotifier** is used to hold the application data and provides access to any internal values as well as the ability to provide methods to access and manipulate the application data.

## Example use
The example directory contains an updated version of the vanilla Flutter application, but updated to show the use of **AppManager**. The example tracks the internal count as well as providing a method to increment the count.

The easiest way to use **AppManager** is to wrap the complete app as shown below:

```dart
import 'package:appmanager/appmanager.dart';
import 'package:example/mydata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    AppManager(
      child: const MyApp(),
      data: MyData()
    )
  );
}
```

if data needs to be loaded on initial start up then the code snippet could be changed as follows:

```dart
import 'package:appmanager/appmanager.dart';
import 'package:example/mydata.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyData data = MyData(); 
  await data.loadData(); 
  runApp(
    AppManager(
      child: const MyApp(), 
      data: data
    )
  );
}
```

