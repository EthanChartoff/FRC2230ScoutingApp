import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/widgets/common/dashboard/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_no_data_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EndgameDashboardMobile2023 extends DashboardPage {
  EndgameDashboardMobile2023({
    Map<String, dynamic Function()>? data,
    String? title,
    String? teamId,
  }) : super(
    title: title ?? 'ENDGAME',
    data: data ?? {
      'scoutingTables' : [GetScoutingData.fromTeamId, teamId],
      'matches' : [GetMatches.ofTeam, teamId],
    }
  );
  
  @override
  Widget buildDashboard({
    required BuildContext context, 
    required Map<String, dynamic> data, 
    required double width, 
    Key? key
  }) {
    if (data['scoutingTables'].isEmpty) {
      return const DashboardNoDataPage();
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer(
            height: 100,
            children: {
              'example' : List.generate(4, (index) => const Text(
                'Example text',
              ))
            }
          ), 
        ),
        Padding(
          padding: const EdgeInsets.all(8.0), 
          child: DashboardContainer<DashboardPiechart>(
            height: 200,
            children: {
              'Endgame Didnt Work or Charge Station' : [
                DashboardPiechart(
                  title: 'Endgame Didnt Work or Charge Station',
                  series: [
                    /// Shows if robot worked in endgame, and if it did, if it was
                    /// on the charge station or not.
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .endgameDidntWorkOrChargeStation(
                          data['scoutingTables']
                        ),
                      xValueMapper: (datum, _) => datum.key,
                      yValueMapper: (datum, _) => datum.value,
                      animationDuration: 0,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    ),
                  ],
                ),
              ], 
              'Charge Station Status' : [
                DashboardPiechart(
                  title: 'Charge Station Status',
                  series: [
                    /// Shows number of robot charge station statuses.
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .chargeStationStatusEndgame(data['scoutingTables']),
                      xValueMapper: (datum, _) => datum.key,
                      yValueMapper: (datum, _) => datum.value,
                      animationDuration: 0,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    ),
                  ],
                ),
              ],
              'From Where Robot Drove to Charge Station' : [
                DashboardPiechart(
                  title: 'From Where Robot Drove to Charge Station',
                  series: [
                    /// Shows number of robot charge station statuses.
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .autoDidntWorkOrChargeStation(
                          data['scoutingTables']
                        ),
                      xValueMapper: (datum, _) => datum.key,
                      yValueMapper: (datum, _) => datum.value,
                      animationDuration: 0,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    ),
                  ],
                ),
              ]
            }
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: DashboardContainer<Widget>(
            height: 300,
            width: double.infinity,
            children: {
              
            },
          ),
        )
      ],
    );
  }
}