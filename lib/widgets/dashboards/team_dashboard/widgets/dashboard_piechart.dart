import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DashboardPiechart extends SfCircularChart {
  DashboardPiechart({
    dynamic Function()? data,
    List<CircularSeries>? series,
    String? title,
  }) : super(
    title: title != null ? ChartTitle(
      text: title
    ) : null,
    series: series 
  );
}