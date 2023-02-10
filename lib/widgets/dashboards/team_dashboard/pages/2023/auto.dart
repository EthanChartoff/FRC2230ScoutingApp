import 'dart:math';

import 'package:flutter/material.dart' /*show 
  StatelessWidget, Widget, BuildContext*/;
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_column.dart';
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
    String? teamId,
    String? title,
  }) : super(
    title: title ?? 'AUTO',
    data: data ?? {
      'scoutingTables' : [GetScoutingData.fromTeamId, teamId],
      'matches' : [GetMatches.ofTeam, teamId],
    }
  );

  /// # Data orginization getters
  

  /// Returns a map of if robot worked in auto, if it did, in that key return 
  /// if robot was on the charge station or not. If it didn't work in auto, 
  /// return in that key that it did not work.
  /// 
  /// sf works with lists, so we cant return a map.
  List<MapEntry<String, int>> autoDidntWorkOrChargeStation(List data) {    
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInAuto'] == '1' ? 
        data[index]['autoChargeStationStatus'] != 'n' ? 
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

  /// Returns a map of if robot worked in auto or not.
  List<MapEntry<String, int>> autoWorked(List data) {
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInAuto'] == '1' ? 
        'Worked' 
        : 'Didnt Work'
    );

    return [
      MapEntry('Worked', listWithAllStates.where((element) => 
        element == 'Worked').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Gets scouting tables and matches, returns a map of ['rowOneCubes'] value 
  /// in the scouting tables with its corresponding match number (the scouting 
  /// table and are matching if matchId of table and id of match are the same).
  List<MapEntry<int, int>> valueByRound(List data, List matches, String value) {
    final List<int> rowOneCubes = List.generate(data.length, (index) => 
      int.parse(data[index][value])
    );

    final matchNumbers = List.generate(data.length, (index) => 
      int.parse(matches.firstWhere((element) => 
        element['id'] == data[index]['matchId']
      )['matchNumber'])
    );
    matchNumbers.sort();

    return List.generate(data.length, (index) => 
      MapEntry(matchNumbers[index], rowOneCubes[index])
    );
  } 
  
  @override
  Widget buildDashboard({
    required context, 
    required data,
    required width,
    key,
  }) {
    final autoDidntWorkOrChargeStationData = 
      autoDidntWorkOrChargeStation(data['scoutingTables']);

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
                width: width - 374, // screen width - 274
                children: {
                  'example' : List.generate(4, (index) => const Text(
                    'Example text',
                  ))
                }
              ),
              DashboardContainer<DashboardPiechart>(  
                height: 370,
                width: 350,
                children: {
                  'auto didnt work or charge station' : [
                    DashboardPiechart(
                      title: 'auto didnt work or charge station',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          dataSource: autoDidntWorkOrChargeStationData,
                          xValueMapper: (datum, index) => datum.key,
                          yValueMapper: (datum, index) => datum.value,
                          animationDuration: 0,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                            useSeriesColor: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                  'did auto work' : [
                    DashboardPiechart(
                      title: 'did auto work',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          dataSource: autoWorked(data['scoutingTables']),
                          xValueMapper: (datum, index) => datum.key,
                          yValueMapper: (datum, index) => datum.value,
                          animationDuration: 0,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                            useSeriesColor: true,
                          ),
                        ),
                      ],
                    ),
                  ]                  
                }
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<Widget>(
            height: 300,
            width: double.infinity,
            children: {
              'Row One Cubes by Round' : [
                DashboardGraph(
                  title: 'Row One Cubes by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored 
                    /// in row one.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'rowOneCubes'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row one.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'tryRowOneCubes'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                  primaryXAxis: NumericAxis(
                    isVisible: false
                  ),
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    header: '',
                    canShowMarker: false,
                    format: 'match number: point.x',
                  ),
                ),

                DashboardColumn(
                  title: 'Row One Cubes by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CUBES scored 
                    /// in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'rowOneCubes'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'tryRowOneCubes'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                )
              ],

              'Row One Cones by Round' : [
                DashboardGraph(
                  title : 'Row One Cones by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CONES scored 
                    /// in row one.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'rowOneCones'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This line shows the amount of CONES that were attempted
                    /// to be scored in row one.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'tryRowOneCones'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                ),

                DashboardGraph(
                  title : 'Row One Cones by p',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CONES scored 
                    /// in row one.
                    LineSeries<dynamic, int>(
                      name: 'pooped',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'rowOneCones'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This line shows the amount of CONES that were attempted
                    /// to be scored in row one.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: valueByRound
                        (data['scoutingTables'], data['matches'], 'tryRowOneCones'), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    )
                  ],
                )
              ]
            }             
          ),
        )
      ],
    );
  }
}