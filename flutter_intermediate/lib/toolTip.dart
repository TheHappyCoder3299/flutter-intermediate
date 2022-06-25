import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _value = "Time not set";
  void _onPressed() => setState(() => _value = new DateTime.now().toString());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Anwit's flutter app")),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Current time is : ${_value}"),
              IconButton(
                icon: Icon(Icons.lock_clock),
                onPressed: _onPressed,
                tooltip: "Displays current date and time",
              )
            ],
          ),
        ),
      ),
    );
  }
}
