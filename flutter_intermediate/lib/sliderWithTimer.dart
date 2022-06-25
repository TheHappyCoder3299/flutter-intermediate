import 'dart:async';
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
  Timer? _timer;
  double _timerValue = 0.0;

  double increment = 0.01;

  // final timer =
  //     Timer(const Duration(seconds: 5), () => print("timer callback invoked"));
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
              RaisedButton(
                onPressed: () => setState(() => _pauseTimer(_timer)),
                child: Text("Pause"),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                onPressed: () => setState(() => _startTimer(_timer)),
                child: Text("Start"),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              LinearProgressIndicator(
                value: _timerValue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startTimer(Timer? timer) {
    increment = 0.01;
    if (_timer == null)
      _timer = Timer.periodic(Duration(seconds: 1), _updateTimerValue);
  }

  void _updateTimerValue(Timer timer) {
    setState(() {
      if (_timerValue >= 1.0) _timerValue = 0.0;
      _timerValue += increment;
    });
  }

  void _pauseTimer(Timer? _timer) {
    if (_timer != null) {
      increment = 0.0;
      // _timer = null;
    }
  }
}
