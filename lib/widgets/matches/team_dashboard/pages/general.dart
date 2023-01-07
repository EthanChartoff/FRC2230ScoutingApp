import 'package:flutter/material.dart' /*show 
  StatelessWidget, Widget, BuildContext*/;
import 'package:scoute_prime/widgets/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/matches/team_dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/matches/team_dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/matches/team_dashboard/widgets/dashboard_piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


/// The first page in [Dashboard], supposed to show the general and 
/// non-detailed data, like all points a team scored in a match.  
class GeneralDashboard extends DashboardPage {

  const GeneralDashboard({
    String? title,
    this.width,
    this.height
  }) : super(
    title: title ?? 'GENERAL'
  );

  final double? width;
  final double? height;

  @override
  Widget buildDashboard({
    required BuildContext context, 
    required data
  }) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DashboardContainer(
              height: 300,
              width: width! - 332,
              child: const SizedBox(),
            ),
            DashboardContainer(
              height: 300,
              width: 300,
              child: DashboardPiechart(
                title: 'LOL2',
                
                series: <CircularSeries>[
                  PieSeries<dynamic, int>(
                    dataSource: data,
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
            ),
    
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: DashboardContainer(
          height: 300,
          width: double.infinity,
          child: DashboardGraph(
            title: 'LOL',
            series: <ChartSeries>[
              LineSeries<dynamic, int>(
                dataSource: data, 
                xValueMapper: (datum, index) => index, 
                yValueMapper: (datum, index) => datum
                  ['alliances']['blue']['score'],
                animationDuration: 0,
                isVisibleInLegend: true
              )
            ],
          ),
        ),
      )
    ],
  );
}