import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DashboardColumn extends SfCartesianChart {
  DashboardColumn({
    List<ChartSeries>? series,
    Color? plotAreaBorderColor,
    String? title,
    ChartAxis? primaryXAxis,
    ChartAxis? primaryYAxis,
    Color? xGridLinesColor,
    Color? yGridLinesColor,
    TooltipBehavior? tooltipBehavior,
    Legend? legend
  }) : super(
    title: title != null ? ChartTitle(
      text: title,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ) : null,
    series: series,
    plotAreaBorderColor: plotAreaBorderColor ?? Colors.blueGrey.withOpacity(0.25),
    primaryXAxis: primaryXAxis ?? NumericAxis(
      majorGridLines: MajorGridLines(
        color: xGridLinesColor ?? Colors.blueGrey.withOpacity(0.25),
      )
    ),
    primaryYAxis: primaryYAxis ?? NumericAxis(
      majorGridLines: MajorGridLines(
        color: yGridLinesColor ?? Colors.blueGrey.withOpacity(0.25),
      )
    ),
    tooltipBehavior: tooltipBehavior,
    legend: legend ?? Legend(
      isVisible: true,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}