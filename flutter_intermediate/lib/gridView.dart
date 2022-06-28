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

class MyTile {
  Color? color;
  String? title;
  MyTile({this.color: Colors.amberAccent, this.title: "default title"});
}

class _State extends State<MyApp> {
  int noOfTiles = 0;
  List<MyTile>? _myTileList;
  @override
  void initState() {
    // TODO: implement initState
    //populating our _myTileList
    _myTileList = [];
    noOfTiles = 16;
    for (int i = 0; i < noOfTiles; i++) {
      _myTileList?.add(new MyTile(title: "${i}"));
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
              Text("Welcome to treasure hunt"),
              GridView.count(
                crossAxisCount: 4,
                children: List<Widget>.generate(
                    noOfTiles, (index) => _createGridTile(index)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _createGridTile(int index) {
    return Container(
      child: GridTile(
          child: Container(
        child: ElevatedButton(
          // style: ButtonStyle(overlayColor: ),
          onPressed: () =>
              setState(() => _myTileList?[index].color = Colors.red),
          child: Text("Child of elevated button"),
        ),
        padding: EdgeInsets.all(15.0),
      )),
    );
  }
}
