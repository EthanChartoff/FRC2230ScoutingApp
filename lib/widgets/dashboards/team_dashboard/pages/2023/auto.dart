import 'package:flutter/material.dart' /*show 
  StatelessWidget, Widget, BuildContext*/;
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/widgets/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


/// The auto page in [Dashboard], shows auto related data.
/// 
/// TODO: change how getting data works, so it's not hardcoded. maybe for each 
/// data visualization, have a function that returns the data. have all the data
/// in dashboard, and pass it to each page.
class AutoDashboard2023 extends DashboardPage {

  AutoDashboard2023({
    Map<String, dynamic Function()>? data,
    String? title,
  }) : super(
    title: title ?? 'AUTO',
    data: data ?? {
      'scoutingTables': GetScoutingData.all,
    }
  );

  @override
  Widget buildDashboard({
    required context, 
    required data,
    required width,
    key,
  }) {
    print(data);
    return Column(
      key: key,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardContainer(
                height: 250,
                width: width - 274, // screen width - 274
                children: [
                  Row(
                    children: List.generate(data.length, (index) => 
                      Text('im debugging')),
                  )
                ],
              ),
              DashboardContainer<DashboardPiechart>(
                height: 250,
                width: 250,
                children: [
                  DashboardPiechart(
                    title: 'LOL2',
                    
                    series: <CircularSeries>[
                      PieSeries<dynamic, int>(
                        dataSource: data['scoutingTables'],
                        xValueMapper: (datum, index) => 0, 
                        yValueMapper: (datum, index) => 0, 
                        radius: '90%',
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                        ),
                        animationDuration: 0
                      )
                    ],
                  ),
                ]
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<DashboardGraph>(
            height: 300,
            width: double.infinity,
            children: <DashboardGraph>[
              DashboardGraph(
                title: 'LOL',
                series: <ChartSeries>[
                  LineSeries<dynamic, int>(
                    dataSource: data['scoutingTables'], 
                    xValueMapper: (datum, index) => 0, 
                    yValueMapper: (datum, index) => 0,
                    animationDuration: 0,
                    isVisibleInLegend: true
                  )
                ],
              ),
            ]
          ),
        )
      ],
    );
  }
}