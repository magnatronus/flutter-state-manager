library appmanager;

import 'package:flutter/material.dart';

/// Internal class used to propagate data changes and app state around the widget tree
class _AppController extends InheritedWidget {
  
  final ChangeNotifier data;

  const _AppController({Key? key, required Widget child, required this.data}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppController oldWidget) {
    return true;
  }    
}



/// This is the main AppManager that is used to wrap a Flutter App to provide State management throughout the app
/// [child] is the main app widget
/// [data] is a ChangeNotifier object used to hold and maintain data and state
/// 
/// Currently designed to propagate ALL notified data changes down the widget tree
class AppManager extends StatefulWidget {
  final Widget child;
  final ChangeNotifier data;

  const AppManager({Key? key, required this.child, required this.data}) : super(key: key);

  @override
  _AppManagerState createState() => _AppManagerState();

  static ChangeNotifier? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_AppController>())!.data;
  }

}


class _AppManagerState extends State<AppManager> {

  @override
  void initState(){
    super.initState();
    widget.data.addListener(changeListener);
  }

  @override
  void dispose(){
    widget.data.removeListener(changeListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return _AppController(child: widget.child, data: widget.data);
  }

  /// Listener used to detect and propagate any notifier updates
  void changeListener(){
    setState((){});
  }

}
