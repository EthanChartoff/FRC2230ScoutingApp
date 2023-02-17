import 'package:flutter/material.dart' /*show 
  StatelessWidget, Widget, BuildContext*/;
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_column.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_piechart.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_table.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


/// The auto page in [Dashboard], shows auto related data.
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

  /// Returns a map of game items on the robot in the start of the match.
  List<MapEntry<String, int>> gameItemsOnRobot(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['startingItemOnRobot']
    );

    return [
      MapEntry('CUBE', listWithAllStates.where((element) => 
        element == 'CUBE').length),
      MapEntry('CONE', listWithAllStates.where((element) => 
        element == 'CONE').length),
      MapEntry('NONE', listWithAllStates.where((element) => 
        element == 'NONE').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of robot charge station statuses.
  List<MapEntry<String, int>> chargeStationStatus(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['autoChargeStationStatus']
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

  /// Returns map of starting positions and how many times they were started in.
  List<MapEntry<String, int>> startingPosition(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['startingPosition']
    );

    return [
      MapEntry('1', listWithAllStates.where((element) => 
        element.characters.last == '1').length),
      MapEntry('2', listWithAllStates.where((element) =>
        element.characters.last == '2').length),
      MapEntry('3', listWithAllStates.where((element) =>
        element.characters.last == '3').length),
    ].where((element) => element.value != 0).toList();
  }
  
  @override
  Widget buildDashboard({
    required context, 
    required data,
    required width,
    key,
  }) {
    return Column(
      key: key,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DashboardContainer<Widget>(
                height: 370,
                width: width - 474, // screen width - 474
                children: {
                  'Game item %' : [
                    Center(
                      child: DashboardTable.textTable(
                        lerpValues: true,
                        children: [
                          const [
                            '',
                            'LOW',
                            'MID',
                            'HIGH',
                          ],
                          [
                            'CUBE',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowOneCubes', 
                                  'tryAutoRowOneCubes'
                                )
                            )}%',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowTwoCubes', 
                                  'tryAutoRowTwoCubes'
                                )
                            )}%',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowThreeCubes', 
                                  'tryAutoRowThreeCubes'
                                )
                            )}%',
                          ],
                          [
                            'CONE',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowOneCones', 
                                  'tryAutoRowOneCones'
                                )
                            )}%',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowTwoCones', 
                                  'tryAutoRowTwoCones'
                                )
                            )}%',
                            '${DashboardFuncs2023.valOrNan(
                                DashboardFuncs2023.ratioOfTwoKeys(
                                  data['scoutingTables'], 
                                  'autoRowThreeCones', 
                                  'tryAutoRowThreeCones'
                                )
                            )}%',
                          ]
                        ]
                      ),
                    )
                  ]
                }
              ),
              DashboardContainer<DashboardPiechart>(  
                height: 370,
                width: 450,
                children: {
                  'auto didnt work or charge station' : [
                    DashboardPiechart(
                      title: 'auto didnt work or charge station',
                      series: <PieSeries<dynamic, String>> [
                        /// Shows if robot worked in auto, and if it did, if it was
                        /// on the charge station or not.
                        PieSeries<dynamic, String>(
                          dataSource: autoDidntWorkOrChargeStation(data['scoutingTables']),
                          xValueMapper: (datum, index) => datum.key,
                          yValueMapper: (datum, index) => datum.value,
                          animationDuration: 0,
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.inside,
                            useSeriesColor: true,
                            builder: (_data, point, series, pointIndex, seriesIndex) {
                              return Text(
                                DashboardFuncs2023.dataLabelPrecent(series, pointIndex, data),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              );
                            },
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
                  ],

                  'Charge Station Status' : [
                    DashboardPiechart(
                      title: 'Charge Station Status',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          dataSource: chargeStationStatus(data['scoutingTables']),
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

                  'Starting Position' : [
                    DashboardPiechart(
                      title: 'Starting Position',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          dataSource: startingPosition(data['scoutingTables']),
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

                  'Game Item on Start of Game' : [
                    DashboardPiechart(
                      title: 'Game Item on Start of Game',
                      series: <PieSeries<dynamic, String>> [
                        PieSeries<dynamic, String>(
                          dataSource: gameItemsOnRobot(data['scoutingTables']),
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowOneCubes'
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
                      dataSource: DashboardFuncs2023.valueByRound
                        (data['scoutingTables'], data['matches'], 'tryAutoRowOneCubes'), 
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowOneCubes'
                      ), 
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowOneCubes'
                      ), 
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
              'Row Two Cubes by Round' : [
                DashboardGraph(
                  title: 'Row Two Cubes by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CUBES scored 
                    /// in row two.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowTwoCubes'
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
                        'tryAutoRowTwoCubes'
                      ), 
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
                  title: 'Row Two Cubes by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CUBES scored 
                    /// in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowTwoCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowTwoCubes'
                      ), 
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
              'Row Three Cubes by Round' : [
                DashboardGraph(
                  title: 'Row Three Cubes by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CUBES scored 
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowThreeCubes'
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
                        'tryAutoRowThreeCubes'
                      ), 
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
                  title: 'Row Three Cubes by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CUBES scored 
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                    /// This line shows the amount of CUBES that were attempted
                    /// to be scored in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowThreeCubes'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CUBE_COLOR
                    ),
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
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowOneCones'
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
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowOneCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                ),

                DashboardColumn(
                  title : 'Row One Cones by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CONES scored 
                    /// in row one.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowOneCones'
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
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowOneCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                )
              ],
              'Row Two Cones by Round' : [
                DashboardGraph(
                  title : 'Row Two Cones by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CONES scored 
                    /// in row two.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowTwoCones'
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
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowTwoCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                ),

                DashboardColumn(
                  title : 'Row Two Cones by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CONES scored 
                    /// in row two.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowTwoCones'
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
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'],
                        data['matches'],
                        'tryAutoRowTwoCones'
                      ),
                      xValueMapper: (datum, index) => datum.key,
                      yValueMapper: (datum, index) => datum.value,
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                )
              ],
              'Row Three Cones by Round' : [
                DashboardGraph(
                  title : 'Row Three Cones by Round',
                  series: <ChartSeries>[
                    /// This line shows the actual amount of CONES scored 
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowThreeCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This line shows the amount of CONES that were attempted
                    /// to be scored in row three.
                    LineSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'tryAutoRowThreeCones'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                ),

                DashboardColumn(
                  title : 'Row Three Cones by Round',
                  series: <ChartSeries>[
                    /// This column shows the actual amount of CONES scored 
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoRowThreeCones'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                    /// This column shows the amount of CONES that were attempted
                    /// to be scored in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Attempted',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'],
                        data['matches'],
                        'tryAutoRowThreeCones'
                      ),
                      xValueMapper: (datum, index) => datum.key,
                      yValueMapper: (datum, index) => datum.value,
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      dashArray: [5, 5],
                      color: ConstColors.ON_CONE_COLOR
                    )
                  ],
                )
              ],
              'Number Of Seconds Until Balanced' : [
                DashboardGraph(
                  title: 'Number Of Seconds Until Balanced',
                  series: <ChartSeries>[
                    /// This line shows the number of seconds until the robot
                    /// was balanced depending on match.
                    LineSeries<dynamic, int>(
                      name: 'Number Of Seconds',
                      dataSource: DashboardFuncs2023.valueByRound<double>(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoNumOfSecondsUntilBalanced'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    header: '',
                    canShowMarker: false,
                    builder: (
                      dynamic _data, dynamic point, dynamic series, 
                      int pointIndex, int seriesIndex) {
                        
                      final chargeStationStatus = DashboardFuncs2023.valueByRound<String>(
                        data['scoutingTables'], 
                        data['matches'], 
                        'autoChargeStationStatus'
                      );
                      
                      return Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "status: ${chargeStationStatus[point.x].value}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "Y: ${point.y}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],

              'Number of Seconds Before The End That Robot Pivoted' : [
                DashboardGraph(
                  title: 'Number of Seconds Before The End That Robot Pivoted',
                  series: <ChartSeries>[
                    /// Shows the number of seconds before the end of the match
                    /// that the robot pivoted depending on match.
                    LineSeries<dynamic, int>(
                      name: 'Number Of Seconds',
                      dataSource: DashboardFuncs2023.valueByRound<double>(
                        data['scoutingTables'], 
                        data['matches'], 
                        'numSecondsBeforeEndPivotedToChargeStation'
                      ), 
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                    ),
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