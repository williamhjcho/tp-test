import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestApp extends StatelessWidget {
  const TestApp({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: child,
    );
  }
}
