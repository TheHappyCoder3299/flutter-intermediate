import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Sales {
  int value;
  charts.Color? color;
  int year;
  Sales({this.year: 0, this.value: 0, this.color});
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  List<charts.Series<Sales, int>> _chartData = [];
  List<Sales> _data = [];
  final rnd = new Random();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _makeData();
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
              Expanded(
                  child: charts.PieChart(
                _chartData,
                animate: true,
                animationDuration: Duration(seconds: 3),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _makeData() {
    _data.add(Sales(
        year: 2013,
        color: charts.MaterialPalette.yellow.shadeDefault,
        value: rnd.nextInt(30)));
    _data.add(Sales(
        year: 2014,
        color: charts.MaterialPalette.red.shadeDefault,
        value: rnd.nextInt(30)));
    _data.add(Sales(
        year: 2015,
        color: charts.MaterialPalette.green.shadeDefault,
        value: rnd.nextInt(30)));
    _data.add(Sales(
        year: 2016,
        color: charts.MaterialPalette.pink.shadeDefault,
        value: rnd.nextInt(30)));
    _data.add(Sales(
        year: 2017,
        color: charts.MaterialPalette.gray.shadeDefault,
        value: rnd.nextInt(30)));

    _chartData.add(new charts.Series(
      id: 'Sales',
      displayName: 'PieChart for Sales data',
      data: _data,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.value,
      colorFn: (Sales sales, _) => sales.color!,
    ));
  }
}
