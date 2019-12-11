import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Sales {
  final String name;
  final int sales;
  final charts.Color barColor;

  Sales({@required this.name, @required this.sales, @required this.barColor});
}
