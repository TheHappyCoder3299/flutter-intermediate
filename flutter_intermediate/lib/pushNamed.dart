import 'dart:ui';

import "package:flutter/material.dart";
import './screens/home.dart';
import './screens/secondScreen.dart';
import './screens/thirdScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => Home(),
        '/Second': (BuildContext context) => SecondScreen(),
        '/Third': (BuildContext context) => ThirdScreen(),
      },
      home: Home(), //first page displayed
    );
  }
}
