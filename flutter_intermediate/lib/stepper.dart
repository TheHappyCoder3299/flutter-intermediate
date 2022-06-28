import 'dart:html';
import 'dart:math';

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
  List<Step> _stepList = [];
  int _stepListCount = 0;

  int _currentStep = 0;

  @override
  void initState() {
    // TODO: implement initState
    _stepListCount = 4;
    for (int i = 0; i < _stepListCount; i++) {
      _stepList.add(Step(
          isActive: true,
          title: Text("Title of step ${i}"),
          content: Text(
            "Content of step ${i}",
          )));
    }
  }

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
              Stepper(
                elevation: 50.0,
                steps: _stepList,
                onStepTapped: (int _currentStepIndex) =>
                    setState(() => _currentStep = _currentStepIndex),
                onStepCancel: () {
                  setState(() {
                    _currentStep = max(0, _currentStep - 1);
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep = min(_stepListCount - 1, _currentStep + 1);
                  });
                },
                currentStep: _currentStep,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
