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


class TeleopDashboard2023 extends DashboardPage {
  TeleopDashboard2023({
    Map<String, dynamic Function()>? data,
    String? title,
    String? teamId,
  }) : super(
    title: title ?? 'TELÉOP',
    data: data ?? {
      'scoutingTables' : [GetScoutingData.fromTeamId, teamId],
      'matches' : [GetMatches.ofTeam, teamId],
    }
  );

  /// # Data orginization getters
  
  /// Returns a map of if robot worked in teleop or not.
  List<MapEntry<String, int>> teleopWorked(List data) {
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInTeleOp'] == '1' ? 
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
                  'Tiro de Bolas' : [
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ],
                  'Tiro de Bolas' : [
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 100,
                      width: 100,
                    ),
                  ],
                },
              ),
              DashboardContainer<DashboardPiechart>(
                height: 370,
                width: 450,
                children: {
                  'Did Robot Work' : [
                    DashboardPiechart(
                      title: 'did teleop work',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          /// TODO: change to func of dashboard funcs
                          dataSource: teleopWorked(data['scoutingTables']),
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
                  'Did Defend' : [
                    DashboardPiechart(
                      title: 'did defend',
                      series: [
                        PieSeries<dynamic, String>(
                          dataSource: DashboardFuncs2023.booleanValueByKey(
                            data['scoutingTables'], 
                            'didDefendTeleOp',
                            'Didnt Defend',
                            'Defended'
                          ),
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
                  'Did Get Defended' : [
                    DashboardPiechart(
                      title: 'did get defended',
                      series: [
                        PieSeries<dynamic, String>(
                          dataSource: DashboardFuncs2023.booleanValueByKey(
                            data['scoutingTables'], 
                            'didGetDefendedTeleOp',
                            'Didnt Get Defended',
                            'Got Defended'
                          ),
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
                  'Did Robot Feed' : [
                    DashboardPiechart(
                      title: 'did robot feed',
                      series: [
                        PieSeries<dynamic, String>(
                          dataSource: DashboardFuncs2023.booleanValueByKey(
                            data['scoutingTables'], 
                            'didFeed',
                            'Didnt Feed',
                            'Fed'
                          ),
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
              )
            ]
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCubes'
                      ),
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
                DashboardColumn(
                  title: 'Row One Cubes by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CUBES scored 
                    /// in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
              ],
              'Row Two Cubes By Round' : [
                DashboardGraph(
                  title: 'Row Two Cubes by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored 
                    /// in row two.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row two.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
                DashboardColumn(
                  title: 'Row Two Cubes by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CUBES scored 
                    /// in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCubes',
                      ),
                      xValueMapper: (datum, index) => datum.key,
                      yValueMapper: (datum, index) => datum.value,
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
              ],
              'Row Three Cubes By Round' : [
                DashboardGraph(
                  title: 'Row Three Cubes by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored 
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
                DashboardColumn(
                  title: 'Row Three Cubes by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CUBES scored 
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'],
                        data['matches'],
                        'tryRowThreeCubes',
                      ),
                      xValueMapper: (datum, index) => datum.key,
                      yValueMapper: (datum, index) => datum.value,
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    )
                  ],
                ),
              ],
              'All Cubes by Round' : [
                DashboardGraph(
                  title: 'Cubes by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored 
                    /// in row one.
                    LineSeries<dynamic, int>(
                      name: 'Row 1 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row one.
                    LineSeries<dynamic, int>(
                      name: 'Row 1 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    ),
                    /// This line shows the actual amount of CUBES scored
                    /// in row two.
                    LineSeries<dynamic, int>(
                      name: 'Row 2 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row two.
                    LineSeries<dynamic, int>(
                      name: 'Row 2 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCubes',
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    ),
                    /// This line shows the actual amount of CUBES scored
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    LineSeries<dynamic, int>(
                      name: 'Row 3 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    )
                  ],
                ),
                DashboardColumn(
                  title: 'Cubes by Round',
                  series: [
                    /// This column shows the actual amount of CUBES scored
                    /// in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 1 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 1 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    ),
                    /// This column shows the actual amount of CUBES scored
                    /// in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 2 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 2 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCubes',
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    ),
                    /// This column shows the actual amount of CUBES scored
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 3 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                    )
                  ],
                )
              ],
              'Row One Cones By Round' : [
                DashboardGraph(
                  title: 'Row One Cones by Round',
                  series: [
                    /// This line shows the actual amount of CONES scored
                    /// in row one.
                    LineSeries<dynamic, int>(
                      name: 'Row 1 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This line shows the amount of CONES that were attempted
                    /// to be scored in row one.
                    LineSeries<dynamic, int>(
                      name: 'Row 1 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                ),
                DashboardColumn(
                  title: 'Row One Cones by Round',
                  series: [
                    /// This column shows the actual amount of CONES scored
                    /// in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 1 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowOneCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This column shows the amount of CONES that were attempted
                    /// to be scored in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 1 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowOneCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                )
              ],
              'Row Two Cones By Round' : [
                DashboardGraph(
                  title: 'Row Two Cones by Round',
                  series: [
                    /// This line shows the actual amount of CONES scored
                    /// in row two.
                    LineSeries<dynamic, int>(
                      name: 'Row 2 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This line shows the amount of CONES that were attempted
                    /// to be scored in row two.
                    LineSeries<dynamic, int>(
                      name: 'Row 2 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                ),
                DashboardColumn(
                  title: 'Row Two Cones by Round',
                  series: [
                    /// This column shows the actual amount of CONES scored
                    /// in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 2 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowTwoCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This column shows the amount of CONES that were attempted
                    /// to be scored in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 2 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowTwoCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key,
                      yValueMapper: (datum, index) => datum.value,
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                )
              ],
              'Row Three Cones By Round' : [
                DashboardGraph(
                  title: 'Row Three Cubes by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    LineSeries<dynamic, int>(
                      name: 'Row 3 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                ),
                DashboardColumn(
                  title: 'Row Three Cubes by Round',
                  series: [
                    /// This column shows the actual amount of CUBES scored
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCubes'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This column shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 3 Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    ),
                  ],
                )
              ]
            },
          ),
        )
      ],
    );
  }
}