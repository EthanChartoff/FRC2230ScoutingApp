import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/dashboard/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_column.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_no_data_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_piechart.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/teleop.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TeleopDashboardMobile2023 extends DashboardPage {
  TeleopDashboardMobile2023({
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

  @override
  Widget buildDashboard({
    required BuildContext context, 
    required Map<String, dynamic> data, 
    required double width, 
    Key? key}) {
      
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<DashboardPiechart>(
            height: 200,
            children: {
              'Did Robot Work' : [
                DashboardPiechart(
                  title: 'did teleop work',
                  series: <PieSeries<dynamic, String>> [
                    PieSeries<dynamic, String>(
                      /// TODO: change to func of dashboard funcs
                      dataSource: DashboardFuncs2023
                        .teleopWorked(data['scoutingTables']),
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
          ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DashboardContainer<Widget>(
          height: max(MediaQuery.of(context).size.height - 454, 300),
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
                  title: 'Row Three Cones by Round',
                  series: [
                    /// This line shows the actual amount of CUBES scored
                    /// in row three.
                    LineSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCones'
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
                        'tryRowThreeCones'
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
                  title: 'Row Three Cones by Round',
                  series: [
                    /// This column shows the actual amount of CUBES scored
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Row 3 Scored',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'rowThreeCones'
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
                        'tryRowThreeCones'
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
              'Number of Cubes feeded into community' : [
                DashboardGraph(
                  title: 'Number of Cubes feeded into community',
                  series: [
                    LineSeries<dynamic, int>(
                      name: 'Cubes feeded into community',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'numOfCubesGatheredToComunity'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                  ],
                ),
                DashboardColumn(
                  title: 'Number of Cubes feeded into community',
                  series: [
                    /// This column shows the actual amount of CUBES scored
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Cubes feeded into community',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'numOfCubesGatheredToComunity'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CUBE_COLOR
                    ),
                  ],
                )
              ],
              'Number Of Cones feeded into community' : [
                DashboardGraph(
                  title: 'Number Of Cones feeded into community',
                  series: [
                    LineSeries<dynamic, int>(
                      name: 'Cones feeded into community',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'numOfConesGatheredToComunity'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                  ],
                ),
                DashboardColumn(
                  title: 'Number Of Cones feeded into community',
                  series: [
                    /// This column shows the actual amount of CUBES scored
                    /// in row three.
                    ColumnSeries<dynamic, int>(
                      name: 'Cones feeded into community',
                      dataSource: DashboardFuncs2023.valueByRound(
                        data['scoutingTables'], 
                        data['matches'], 
                        'numOfConesGatheredToComunity'
                      ),
                      xValueMapper: (datum, index) => datum.key, 
                      yValueMapper: (datum, index) => datum.value,  
                      animationDuration: 0,
                      isVisibleInLegend: true,
                      color: ConstColors.CONE_COLOR
                    ),
                  ],
                )
              ],
            },
          ),
        ),
      ]
    );
  }
}