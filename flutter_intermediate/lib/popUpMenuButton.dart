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

enum Animal { Cat, Dog, Elephant, Horse }

class _State extends State<MyApp> {
  List<PopupMenuItem> _list = [];

  String _value = "Nothing selected yet";
  @override
  void initState() {
    // TODO: implement initState
    for (Animal animal in Animal.values) {
      String textToDisplay =
          animal.toString().substring(animal.toString().indexOf('.') + 1);
      _list.add(PopupMenuItem(
        child: Row(
          children: [
            Text("${textToDisplay}"),
            Icon(Icons.catching_pokemon_outlined),
          ],
        ),
        value: textToDisplay,
      ));
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
              Row(
                children: [
                  Text("Selected value is ${_value}"),
                  PopupMenuButton(
                    onSelected: _onSelected,
                    itemBuilder: (BuildContext context) {
                      return _list;
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSelected(value) {
    setState(() {
      _value = value;
    });
  }
}
