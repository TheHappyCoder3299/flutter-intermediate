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
  List<Widget> _list = [];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Anwit's flutter app")),
      floatingActionButton:
          new FloatingActionButton(onPressed: _addItem, child: Icon(Icons.add)),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }

  void _addItem() {
    counter++;
    setState(() {
      // _list.add(new Container(
      //   child: new Text("this is a new container"),
      // ));

      // switch (Random().nextInt(2)) {
      //   case 0:
      //     _list.add(new Container(
      //       child: new Text("this is a new container"),
      //     ));
      //     break;
      //   case 1:
      //     _list.add(new Card(
      //       child: Container(
      //         padding: EdgeInsets.all(12.0),
      //         child: Text("this is a new card"),
      //       ),
      //     ));
      //     break;
      // }
      Key key = new Key("chip : ${counter}");
      _list.add(Container(
        padding: EdgeInsets.all(5.0),
        key: key,
        child: Chip(
            avatar: CircleAvatar(
                backgroundColor: Colors.blue, child: Text("${counter}")),
            deleteIcon: Icon(Icons.delete),
            deleteIconColor: Colors.red,
            onDeleted: () => _removeItemWithKey(key),
            deleteButtonTooltipMessage: "Delete ",
            padding: EdgeInsets.all(15.0),
            label: Text("${counter} : new chip")),
      ));
    });
  }

  void _removeItemWithKey(Key key) {
    print("inside _removeItemWithKey");
    setState(() {
      for (int index = 0; index < _list.length; index++) {
        Widget container = _list.elementAt(index);
        if (container.key == key) {
          _list.removeAt(index);
          break;
        }
      }
    });
  }
}
