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

class MyItem {
  bool isExpanded;
  String header;
  Widget body;
  // MyItem(bool isExpanded, String header, Widget body) {
  //   this.isExpanded = isExpanded;
  //   this.header = header;
  //   this.body = body;
  // }

  MyItem(this.isExpanded, this.header, this.body);
}

class _State extends State<MyApp> {
  int noOfItems = 8;

  List<MyItem> _myItemList = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < noOfItems; i++) {
      _myItemList.add(new MyItem(
          false,
          "Expansion panel no. ${i}",
          Container(
              padding: EdgeInsets.all(15.0),
              child: Text("Body of expansion panel no. ${i}"))));
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
              ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) => setState(() {
                  _myItemList[panelIndex].isExpanded =
                      !_myItemList[panelIndex].isExpanded;
                }),
                children: _myItemList.map(createExpansionPanel).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  ExpansionPanel createExpansionPanel(MyItem myItem) {
    return ExpansionPanel(
        isExpanded: myItem.isExpanded,
        headerBuilder: (context, isExpanded) => Container(
              padding: EdgeInsets.all(15.0),
              child: Text("${myItem.header}"),
            ),
        body: myItem.body);
  }
}
