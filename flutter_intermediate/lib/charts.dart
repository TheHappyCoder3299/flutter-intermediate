import 'dart:html';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
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
  final rnd = new Random();
  List<Sales> _data = [];
  List<charts.Series<Sales, String>> _chartData = [];
  void _makeData() {
    for (int i = 2010; i < 2023; i++) {
      _data.add(new Sales(year: i.toString(), value: rnd.nextInt(1000)));
    }

    _chartData.add(new charts.Series(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      data: _data,
      domainFn: (Sales sales, _) => sales.year,
      measureFn: (Sales sales, _) => sales.value,
      fillPatternFn: (_, __) => charts.FillPatternType.solid,
      displayName: 'sales',
    ));
  }

  @override
  void initState() {
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
            children: <Widget>[Expanded(child: charts.BarChart(_chartData))],
          ),
        ),
      ),
    );
  }
}

class Sales {
  String year = "";
  int value = 0;

  Sales({this.year: "", this.value: 0});
}
