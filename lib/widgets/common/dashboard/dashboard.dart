import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_title.dart';
import 'package:scoute_prime/widgets/common/dashboard/filters_dialog.dart';

import 'package:scoute_prime/widgets/common/searchboxes.dart';
import 'package:scoute_prime/misc/teams_data.dart';

/// Skeleton for a dashboard. can scrolls through all given [dashboardPages] and
/// filter data by selecting items in the filters dialog [filtersCard].
class Dashboard extends StatefulWidget {
  const Dashboard({
    required this.dashboardPages,
    this.matchKey,
    this.teamNumber,
  }) : assert(matchKey != null || teamNumber != null,
            'dashboard must get a match key or a team number to get data');

  final List<DashboardPage> dashboardPages;

  final String? matchKey;
  final int? teamNumber;

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentPage = 0;
  late PageController _pageController;
  late DashboardTitle _title;

  final key = GlobalKey();

  /// Used to check page index and give page its name,
  // late String pageName;

  int? prevTeam;

  /// Filters for filters dialog
  Filter<String>? _yearsParticipated;

  /// All matches before
  List<dynamic>? _matchesBefore;

  List<Map<String, List>>? _futureData;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: true,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _title = DashboardTitle(
      title:
          '${widget.teamNumber} ${TeamsData.allTeams.where((element) => 
            element.number == widget.teamNumber).first.name}',
      matches: _matchesBefore,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future get getPageData async {
    _yearsParticipated ??= Filter<String>(
        items: [for (var i = 1992; i < DateTime.now().year; i++) i.toString()],
        selectedItems: [DateTime.now().year.toString()]);

    if (widget.teamNumber != prevTeam || _futureData == null) {
      _futureData = List.generate(
          widget.dashboardPages.length,
          (index) => widget.dashboardPages[index].data
              .map((key, value) => MapEntry(key, [])));

      _matchesBefore = await GetMatches.ofTeam(widget.teamNumber!.toString());

      for (var element in _futureData!) {
        element.forEach((key, value) async {
          final dataFuncOfPage =
              widget.dashboardPages[_futureData!.indexOf(element)].data[key]!;
          // TODO: fix this, may have more then one argument or none
          _futureData![_futureData!.indexOf(element)][key] =
              await dataFuncOfPage[0](dataFuncOfPage[1]);
        });
      }
      prevTeam = widget.teamNumber;

      var counter = 0;

      /// wait for all data to be fetched
      /// TODO: THIS IS BAD, FIX THIS
      while (_futureData!.any((element) =>
          element.values.any((value) => value.isEmpty && counter < 1000))) {
        await Future.delayed(const Duration(milliseconds: 100));
        counter++;
      }
      return _futureData;
    } else {
      /// this else is intentional, if the return is outside the else,
      /// [_futureData] can be returned with a null value
      return _futureData;
    }
  }

  Widget get filtersCard => Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Theme(
          data: ThemeData(
              hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
          child: SizedBox(
            width: 300,
            height: 50,
            child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => TeamsFiltersDialog(
                      yearsParticipated: _yearsParticipated!,
                      onChange: (item) async {
                        _yearsParticipated!.onUnselect(
                            _yearsParticipated!.selectedItems.first);

                        /// TODO: fix this
                        _futureData = await widget
                            .dashboardPages.first.data['allData']!
                            .first();
                        setState(() {});
                      })),
              child: Text(
                'filters',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ),
      );

  Widget dashboardsideButton(
          {required Icon icon, required void Function() onPressed}) =>
      SizedBox(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: getPageData,
        builder: (context, snapshot) {
          if (_futureData!.any((element) => element.values.isEmpty)) {
            /// set state to rebuild the page when data is fetched
            WidgetsBinding.instance
                .addPostFrameCallback((_) => setState(() {}));
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            /// The widget displayed when there's data to display.
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: _title,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dashboardsideButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          if (_pageController.page! ==
                                  _pageController.page!.roundToDouble() &&
                              _pageController.page! != 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.fastOutSlowIn,
                            );
                          }
                        }),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 172,
                      height: MediaQuery.of(context).size.height - 54,
                      child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              child: widget.dashboardPages[
                                      index % widget.dashboardPages.length]
                                  .buildDashboard(
                                context: context,
                                data: _futureData![
                                    index % widget.dashboardPages.length],
                                width: MediaQuery.of(context).size.width - 170,
                              ),
                            );
                          }),
                    ),
                    dashboardsideButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          if (_pageController.page! ==
                              _pageController.page!.roundToDouble()) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn);
                          }
                        })
                  ],
                ),
              ],
            );
          } else {
            /// The widget displayed when there's no data to display.
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
