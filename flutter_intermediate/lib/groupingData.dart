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

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class Sales {
  int value;
  String year;

  Sales({this.value: 0, this.year: ""});
}

class _State extends State<MyApp> {
  final rnd = new Random();
  List<Sales> _laptops = [];
  List<Sales> _desktops = [];
  List<charts.Series<Sales, String>> _chartData = [];
  void _makeData() {
    for (int i = 2015; i < 2023; i++) {
      _laptops.add(new Sales(value: rnd.nextInt(1000), year: i.toString()));
      _desktops.add(new Sales(value: rnd.nextInt(1000), year: i.toString()));
    }
    _chartData.add(new charts.Series(
      id: 'Sales data',
      data: _laptops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.value,
      displayName: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
    ));
    _chartData.add(new charts.Series(
      id: 'Sales data',
      data: _desktops,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.value,
      displayName: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
    ));
  }

  @override
  void initState() {
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
                  child: charts.BarChart(
                _chartData,
                vertical: false,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
