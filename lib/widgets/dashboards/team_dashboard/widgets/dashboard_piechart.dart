import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPiechart extends SfCircularChart {
  DashboardPiechart({
    List<CircularSeries<dynamic, dynamic>>? series,
    ChartTitle? chartTitle,
    String? title,
  }) :  super(
    series: series,
    legend: Legend(
      isVisible: true, 
      overflowMode: LegendItemOverflowMode.scroll,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
    title: chartTitle ?? ChartTitle(
      text: title ?? '',
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
  );
}