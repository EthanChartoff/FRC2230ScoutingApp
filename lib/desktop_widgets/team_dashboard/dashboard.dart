import 'package:flutter/material.dart';
import 'package:scoute_prime/api/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/variables/teams_data.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  /// 
  final int teamNumber;

  const Dashboard({
    required this.teamNumber
  });

  
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  final _pageController = PageController();

  final _pageTitles = [
    'MAIN',
    'AUTO',
    'TELEOP',
    'ENDGAME'
  ];

  /// Used to check page index and give page its name
  String _pageName = 'MAIN';
  double _currPage = 0; 

  @override
  void initState() {
    // try {
    //   _currPage = _pageController.page! % 4.0; 
    // } catch (err) {
    //   if(err == "PageController.page cannot be accessed before a PageView is built with it."
    //     || err == "Field '_currPage' has not been initialized.") {
    //     _currPage = 0;
    //   } else {
    //     throw Exception(err.toString());
    //   }
    // }
    // setState(() {
    //   _pageName = _pageTitles[_currPage.floor()];
    // });

    super.initState();
  }


  Widget get title {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${widget.teamNumber} ${TeamsData.israelTeamsDatas
          .where((element) => element.number == widget.teamNumber).first
          .name}',
          
            style: Theme.of(context).textTheme.headline2,
          ),

          Text(_pageName,
          
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }

  Widget dashboardsideButton({
    required Icon icon,
    required void Function() onPressed
  }) => SizedBox(
    height: MediaQuery.of(context).size.height - 60,
    width: 50,
    child: Material(
      color: Theme.of(context).backgroundColor,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    ),
  );

  Widget dashboardChart({
    required List<MapEntry> data,
    double? height
  }) => LayoutBuilder(
    builder: (_, constraints) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).backgroundColor,
        elevation: 20,
        borderRadius: BorderRadius.circular(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: height,
            width: MediaQuery.of(context).size.width - 170,
            color: Theme.of(context).primaryColorDark,
            child: charts(data),
          ),
        ),
      ),
    ),
  );

  Widget charts(List<MapEntry> data) {
    return PageView.builder(
      itemCount: 2,
      pageSnapping: true,
      controller: PageController(),
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SfCartesianChart(
            plotAreaBorderColor: Theme.of(context).canvasColor.withOpacity(0.3),
            primaryXAxis: NumericAxis(
              majorGridLines: MajorGridLines(
                color: Theme.of(context).canvasColor.withOpacity(0.3),
              ),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: MajorGridLines(
                color: Theme.of(context).canvasColor.withOpacity(0.3),
              ),
            ),
            series: <ChartSeries>[
              LineSeries<MapEntry, int>(
                dataSource: data,
                xValueMapper: (datum, index) => datum.key,
                yValueMapper: (datum, index) => datum.value,
                markerSettings: const MarkerSettings(
                  isVisible: true
                )
              )
            ],
          ),
        );
      },
    );
  }

  Widget mainDashboard(List<MapEntry> data) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
    
          dashboardChart(
            data: data,
            height: 230
          ),
    
          dashboardChart(
            data: data,
            height: 300
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: GetScoutingData.all(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              List<MapEntry> data = const [
                MapEntry(1, 1),
                MapEntry(2, 6),
                MapEntry(3, 2),
                MapEntry(4, 4),
              ];
              /// The widget displayed when there's data to display.
              return Column(
                children: [
                  title,
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dashboardsideButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          if(_pageController.page! == _pageController.page!.roundToDouble() && _pageController.page! != 0) {
                            setState(() {
                              _pageName = _pageTitles[((_pageController.page! - 1) % 4).ceil()];
                              _pageController.previousPage(
                                duration: const Duration(milliseconds: 400), 
                                curve: Curves.fastOutSlowIn,
                              );
                            });
                          }
                        }
                      ),
    
                      SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 170,
                          height: MediaQuery.of(context).size.height - 60,
                          child: PageView.builder(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if(index % 2 == 0) {
                                return mainDashboard(data);
                              }
                              else {
                                return Container();
                              }
                              
                            }
                          ),
                        ),
                      ),

                      dashboardsideButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          if(_pageController.page! == _pageController.page!.roundToDouble()) {
                            setState(() {
                              _pageName = _pageTitles[((_pageController.page! + 1) % 4).ceil()];
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400), 
                                curve: Curves.fastOutSlowIn
                              );
                            });
                          }
                        }
                      )
                    ],
                  ),      
                ],
              );               
            }
            else {
              /// The widget displayed when there's no data to display.
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

}