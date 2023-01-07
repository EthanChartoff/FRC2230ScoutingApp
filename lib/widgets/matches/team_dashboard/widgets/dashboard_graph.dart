import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DashboardGraph extends SfCartesianChart {
  DashboardGraph({
    List<ChartSeries>? series,
    Color? plotAreaBorderColor,
    String? title,
    Color? xGridLinesColor,
    Color? yGridLinesColor,
  }) : super(
    title: title != null ? ChartTitle(
      text: title
    ) : null,
    series: series,
    plotAreaBorderColor: plotAreaBorderColor ?? Colors.blueGrey.withOpacity(0.25),
    primaryXAxis: NumericAxis(
      majorGridLines: MajorGridLines(
        color: xGridLinesColor ?? Colors.blueGrey.withOpacity(0.25),
      )
    ),
    primaryYAxis: NumericAxis(
      majorGridLines: MajorGridLines(
        color: yGridLinesColor ?? Colors.blueGrey.withOpacity(0.25),
      )
    ),
  );
}