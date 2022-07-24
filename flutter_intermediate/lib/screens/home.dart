import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Home page"),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/Second'),
                  child: Text("Go to second screen"))
            ],
          ),
        ),
      ),
    );
  }
}
