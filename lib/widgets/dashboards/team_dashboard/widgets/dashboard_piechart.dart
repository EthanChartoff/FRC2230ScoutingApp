import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPiechart extends StatelessWidget {
  DashboardPiechart({
    this.data,
    this.series,
    this.title,
    List<Color>? palette,
  }) : assert(data != null || series != null), 
  palette = palette ??SfCircularChart().palette;  

  final List<MapEntry<dynamic, dynamic>> Function()? data;

  final List<CircularSeries>? series;

  final String? title;

  final List<Color> palette;

  @override
  Widget build(BuildContext context) {
    final List<MapEntry<dynamic, dynamic>>? chartData = data != null ? data!() : null;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        title != null ? Text(title!) : const SizedBox(),
        SizedBox(
          height: 50,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: series != null ? series!.length : chartData!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: palette[index % palette.length],
                  ),
                ),
                title: Text(series != null 
                ? series![index].dataSource![index].key 
                : chartData![index].key.toString()),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
        SfCircularChart(
          series: series ?? [
            PieSeries(
              dataSource: chartData,
              xValueMapper: (dynamic data, _) => data.key,
              yValueMapper: (dynamic data, _) => data.value,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
            ),
          ],
        ),
      ],
    );
  }
}
