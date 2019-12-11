import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../../models/sales_stats.dart';

class BarChart extends StatelessWidget {
  final List<Sales> data;

  BarChart(this.data);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Sales, String>> series = [
      charts.Series(
        id: "Sales",
        data: data,
        domainFn: (Sales series, _) => series.name,
        measureFn: (Sales series, _) => series.sales,
        colorFn: (Sales series, _) => series.barColor,
      ),
    ];
    return charts.BarChart(
      series,
      animate: false,
    );
  }
}


