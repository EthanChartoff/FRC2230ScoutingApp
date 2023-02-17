import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


/// a graph for [AllTeamsPage] that shows a single datapoint in a graph of 
/// a select group of teams. 
class AllTeamsGraph extends SfCartesianChart {
  AllTeamsGraph({
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