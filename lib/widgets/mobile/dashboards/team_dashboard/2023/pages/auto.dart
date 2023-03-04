import 'dart:math';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/dashboard/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_column.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_container.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_no_data_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_piechart.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_table.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

/// The auto page in [Dashboard], shows auto related data.
/// only for mobile.
class AutoDashboardMobile2023 extends DashboardPage {

  AutoDashboardMobile2023({
    Map<String, dynamic Function()>? data,
    String? teamId,
    String? title,
  }) : super(
    title:  title ?? 'AUTO',
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
    /// If there is no data, return [DashboardNoDataPage].
    if (data['scoutingTables'].isEmpty) {
      return const DashboardNoDataPage();
    } 

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<Widget>(
            height: 10,
            children: {
              'Game item %' : [
                Center(
                  child: DashboardTable.textTable(
                    lerpValues: true,
                    children: [
                      [
                        '',
                        AppLocalizations.of(context).low,
                        AppLocalizations.of(context).mid,
                        AppLocalizations.of(context).high,
                      ],
                      [
                      AppLocalizations.of(context).cube,
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
                      AppLocalizations.of(context).cone,
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
                      )}%'
                    ]]
                  ),
                )
              ],
              'Worked, Went out of community and Charge Station' : [
                Center(
                  child: DashboardTable.textTable(
                    lerpValues: true,
                    children: [
                      [
                        AppLocalizations.of(context).worked,
                        AppLocalizations.of(context).outOfCommunity,
                        AppLocalizations.of(context).onChargeStation
                      ],
                      [
                        '${DashboardFuncs2023.valOrNan(
                          DashboardFuncs2023.precentOfBoolKey(
                            data['scoutingTables'], 
                            'didRobotWorkInAuto', 
                          )
                        )}%',
                        '${DashboardFuncs2023.valOrNan(
                          DashboardFuncs2023.precentOfBoolKey(
                            data['scoutingTables'], 
                            'autoDidRobotComeOutOfComunity', 
                          )
                        )}%',
                        '${() {
                          final listWithAllStates = DashboardFuncs2023
                            .chargeStationStatusAuto(
                              data['scoutingTables']
                            );
                          
                          final dockAndEngaged = listWithAllStates.reduce((value, element) {
                            if(element.key == 'DOCKED' || element.key == 'ENGAGED') {
                              return MapEntry('dockAndEngaged', element.value);
                            }
                            return value;
                          });

                          return dockAndEngaged.value / 
                            listWithAllStates.reduce((value, element) => 
                              MapEntry('total', value.value + element.value)
                            ).value;
                        }.call()}%'
                      ],
                    ]
                  ),
                )
              ],                
            }
          ),
        ),
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<DashboardPiechart>(  
            height: 200,
            children: {
              'auto didnt work or charge station' : [
                DashboardPiechart(
                  title: AppLocalizations.of(context).autoDidntWorkOnChargeStation,
                  series: <PieSeries<dynamic, String>> [
                    /// Shows if robot worked in auto, and if it did, if it was
                    /// on the charge station or not.
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .autoDidntWorkOrChargeStation(data['scoutingTables']),
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
                  title: AppLocalizations.of(context).didPhaseWork(
                    AppLocalizations.of(context).auto
                  ),
                  series: <PieSeries<dynamic, String>> [
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .autoWorked(data['scoutingTables']),
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
                  title: AppLocalizations.of(context).chargeStationStatus,
                  series: <PieSeries<dynamic, String>> [
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .chargeStationStatusAuto(data['scoutingTables']),
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
                  title: AppLocalizations.of(context).startingPos,
                  series: <PieSeries<dynamic, String>> [
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .startingPosition(data['scoutingTables']),
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
                  title: AppLocalizations.of(context).gameItemOnStartOfGame,
                  series: <PieSeries<dynamic, String>> [
                    PieSeries<dynamic, String>(
                      dataSource: DashboardFuncs2023
                        .gameItemsOnRobot(data['scoutingTables']),
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DashboardContainer<Widget>(
            height: max(MediaQuery.of(context).size.height - 454, 300),
            children: {
              'Row One Cubes by Round' : [
                DashboardGraph(
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).low,
                    AppLocalizations.of(context).cube
                  ),
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
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).low,
                    AppLocalizations.of(context).cube
                  ),
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
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).mid,
                    AppLocalizations.of(context).cube
                  ),
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
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).mid,
                    AppLocalizations.of(context).cube
                  ),
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
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).high,
                    AppLocalizations.of(context).cube
                  ),
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
                  title: AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).high,
                    AppLocalizations.of(context).cube
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).low,
                    AppLocalizations.of(context).cone
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).low,
                    AppLocalizations.of(context).cone
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).mid,
                    AppLocalizations.of(context).cone
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).mid,
                    AppLocalizations.of(context).cone
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).high,
                    AppLocalizations.of(context).cone
                  ),
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
                  title : AppLocalizations.of(context).rowItemByRound(
                    AppLocalizations.of(context).high,
                    AppLocalizations.of(context).cone
                  ),
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
                      name: AppLocalizations.of(context).attempted,
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
                  title: AppLocalizations.of(context)
                    .numOfSecsUntilBalancedOnChargeStation,
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
                  title: AppLocalizations.of(context).numOfSecsBeforeTheEndRobotPivotedToChargeStation,
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
