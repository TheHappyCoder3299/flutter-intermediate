import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Sdcond Screen"),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Third'),
                  child: Text("Go to third screen"))
            ],
          ),
        ),
      ),
    );
  }
}
