import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/pages/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_column.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_piechart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class EndgameDashboard2023 extends DashboardPage {
  EndgameDashboard2023({
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

  /// # Data orginization getters
  
  /// Returns a map of if robot worked in teleop, if it did, in that key return 
  /// if robot was on the charge station or not. If it didn't work in teleop, 
  /// return in that key that it did not work. 
  List<MapEntry<String, int>> endgameDidntWorkOrChargeStation(List data) {    
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInTeleOp'] == '1' ? 
        data[index]['autoChargeStationStatus'] == 'DOCKED' 
        || data[index]['autoChargeStationStatus'] == 'ENGAGED'? 
          'On Charge Station' 
          : 'Off Charge Station' 
          : 'Didnt Work'
    );

    return [
      MapEntry('On Charge Station', listWithAllStates.where((element) => 
        element == 'On Charge Station').length),
      MapEntry('Off Charge Station', listWithAllStates.where((element) => 
        element == 'Off Charge Station').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of robot charge station statuses.
  List<MapEntry<String, int>> chargeStationStatus(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['endGameChargeStationStatus']
    );

    return [
      MapEntry('DOCKED', listWithAllStates.where((element) => 
        element == 'DOCKED').length),
      MapEntry('ENGAGED', listWithAllStates.where((element) => 
        element == 'ENGAGED').length),
      MapEntry('PARKED', listWithAllStates.where((element) => 
        element == 'PARKED').length),
      MapEntry('NONE', listWithAllStates.where((element) => 
        element == 'NONE').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of where robot drove to charge station.
  List<MapEntry<String, int>> fromWhereRobotDroveToChargeStation(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['fromWhereRobotDroveToChargeStation']
    );

    return [
      MapEntry('COMUNITY', listWithAllStates.where((element) => 
        element == 'COMUNITY').length),
      MapEntry('OUT', listWithAllStates.where((element) => 
        element == 'OUT').length),
    ].where((element) => element.value != 0).toList();
  }
  
  @override
  Widget buildDashboard({required BuildContext context, required Map<String, dynamic> data, required double width, Key? key}) {
    return Column(
      key: key,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardContainer(
                height: 370,
                width: width - 474,
                children: {
                  'example' : List.generate(4, (index) => const Text(
                    'Example text',
                  ))
                }
              ),
              DashboardContainer<DashboardPiechart>(
                height: 370,
                width: 450,
                children: {
                  'Endgame Didnt Work or Charge Station' : [
                    DashboardPiechart(
                      title: 'Endgame Didnt Work or Charge Station',
                      series: [
                        /// Shows if robot worked in endgame, and if it did, if it was
                        /// on the charge station or not.
                        PieSeries<dynamic, String>(
                          dataSource: endgameDidntWorkOrChargeStation(data['scoutingTables']),
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
                          dataSource: chargeStationStatus(data['scoutingTables']),
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
                          dataSource: fromWhereRobotDroveToChargeStation(
                            data['scoutingTables']),
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
              )
            ],
          )
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
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