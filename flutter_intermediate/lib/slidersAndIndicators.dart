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
  double _value = 0.5;

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
              Slider(value: _value, onChanged: _onChanged),
              LinearProgressIndicator(
                value: _value,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(197, 255, 4, 20)),
              ),
              Padding(padding: EdgeInsets.all(30.0)),
              CircularProgressIndicator(
                value: _value,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 184, 249, 3)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChanged(double value) {
    setState(() => _value = value);
  }
}
