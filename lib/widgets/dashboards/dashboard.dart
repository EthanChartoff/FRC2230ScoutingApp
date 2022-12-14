import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:scoute_prime/api/TBA/get_matches.dart';

import 'package:scoute_prime/api/TBA/get_team.dart';
import 'package:scoute_prime/widgets/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/matches/team_dashboard/filters_dialog.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';
import 'package:scoute_prime/misc/enums.dart';
import 'package:scoute_prime/misc/teams_data.dart';


/// Skeleton for a dashboard. can scrolls through all given [dashboardPages] and
/// filter data by selecting items in the filters dialog [filtersCard].
class Dashboard extends StatefulWidget {

  const Dashboard({
    required this.dashboardPages,
    this.matchKey,
    this.teamNumber,
    this.future,
  }) : 
  assert(matchKey != null || teamNumber != null,
   'dashboard must get a match key or a team number to get data');

  final List<DashboardPage> dashboardPages;

  final String? matchKey;
  final int? teamNumber;

  final Future<dynamic> Function(String)? future;
  
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>{
  final _pageController = PageController();

  /// Used to check page index and give page its name,
  /// TODO: change name to first page title 
  String pageName = 'GENERAL';

  int? prevTeam;

  /// Filters for filters dialog
  Filter<String>? _yearsParticipated;

  dynamic _futureData;

  Future get getPageData async {
    _yearsParticipated ??= Filter<String>(
      items: await GetTeamsTBA.yearsParticipated(widget.teamNumber!.toString())
        .then<List<String>>((value) {
          var list = <String>[];
          value.forEach((element) {
            list.add(element.toString());
          });
          list.remove('2022');
          return list;
        }),
      selectedItems: ['2022']
    );    

    if(widget.teamNumber != prevTeam) {
      _futureData = await GetMatchesTBA.matchesOfTeamInYear(
        widget.teamNumber.toString(), 
        _yearsParticipated!.selectedItems.last
      );
      prevTeam = widget.teamNumber;
    }
    return Future.value('done');
  }

  Widget get filtersCard => Card(
    color: Theme.of(context).canvasColor,
    child: Theme(
      data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
      child: SizedBox(
        width: 300,
        height: 50,
        child: TextButton(
          onPressed: () => showDialog(
            context: context, 
            builder: (context) => TeamsFiltersDialog(
              yearsParticipated: _yearsParticipated!,
              onChange: (item) async {
                _yearsParticipated!.onUnselect(_yearsParticipated!.selectedItems.first);
                _futureData = await GetMatchesTBA.matchesOfTeamInYear(
                  widget.teamNumber.toString(), 
                  _yearsParticipated!.selectedItems.last
                );
                setState(() {});
              }
            )
          ),
          child: Text(
            'filters',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    ),
  );

  Widget dashboardsideButton({
    required Icon icon,
    required void Function() onPressed
  }) => SizedBox(
    height: MediaQuery.of(context).size.height - 74,
    width: 50,
    child: Material(
      color: Theme.of(context).backgroundColor,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
      ),
    ),
  );

  Widget title({
    required String title, 
    required String pageName, 
    required DashboardViewTypes titleType,
  }) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 550,
                child: Text('$title - $pageName',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),

            SizedBox(
              width: max(MediaQuery.of(context).size.width - 950, 0),
            ),

            filtersCard      
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageTitles = List.generate(widget.dashboardPages.length, 
      (index) => widget.dashboardPages[index].title);

    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: getPageData,
        builder: (context, snapshot) {
          if(snapshot.hasData && _futureData != null) {
            /// The widget displayed when there's data to display.
            return Column(
              children: [
                title(
                  title: '${widget.teamNumber} ${TeamsData.allTeams
                    .where((element) => element.number == widget.teamNumber)
                    .first.name}',
                  pageName: pageName,
                  titleType: DashboardViewTypes.team
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardsideButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        if(_pageController.page! == _pageController.page!.roundToDouble() && _pageController.page! != 0) {
                          setState(() {
                            pageName = pageTitles[((_pageController.page! - 1) % widget.dashboardPages.length).ceil()];
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 400), 
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        }
                      }
                    ),
    
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 170,
                      height: MediaQuery.of(context).size.height - 74,
                      child: PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {     
                          return SingleChildScrollView(
                            child: widget.dashboardPages[index % widget.dashboardPages.length]
                              .buildDashboard(
                                context: context, 
                                data: _futureData
                              ),
                          );
                        }
                      ),
                    ),

                    dashboardsideButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        if(_pageController.page! == _pageController.page!.roundToDouble()) {
                          setState(() {
                            pageName = pageTitles[((_pageController.page! + 1) % widget.dashboardPages.length).ceil()];
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
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

}