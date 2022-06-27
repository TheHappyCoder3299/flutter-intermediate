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

class Choice {
  final String? title;
  final IconData? icon;

  Choice({this.title, this.icon});
}

class _State extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController? _controller;

  List<Choice> _choiceList = <Choice>[
    Choice(title: 'CAR', icon: Icons.directions_car),
    Choice(title: 'BICYCLE', icon: Icons.directions_bike),
    Choice(title: 'BOAT', icon: Icons.directions_boat),
    Choice(title: 'BUS', icon: Icons.directions_bus),
    Choice(title: 'TRAIN', icon: Icons.directions_train),
    Choice(title: 'WALK', icon: Icons.directions_walk),
  ];
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(length: _choiceList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Anwit's flutter app"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            //Theme applies a particular theme to descendant of widgets
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.amber),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(
                  controller: _controller,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
            controller: _controller,
            children: _choiceList.map((Choice choice) {
              return Container(
                padding: EdgeInsets.all(25.0),
                child: Center(
                    child: Column(children: <Widget>[
                  Text(choice.title!),
                  Icon(choice.icon, size: 120.0)
                ])),
              );
            }).toList()));
  }
}
