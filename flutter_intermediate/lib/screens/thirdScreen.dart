import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _thirdScreenState createState() => _thirdScreenState();
}

class _thirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("third screen"),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Home'),
                  child: Text("Go to home screen"))
            ],
          ),
        ),
      ),
    );
  }
}
