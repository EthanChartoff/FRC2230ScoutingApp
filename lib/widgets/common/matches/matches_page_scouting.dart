import 'package:flutter/material.dart';

import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/TBA/get_event.dart';
import 'package:scoute_prime/api/TBA/get_matches.dart';
import 'package:scoute_prime/widgets/common/matches/match_cards/ended.dart';
import 'package:scoute_prime/widgets/common/matches/match_cards/future.dart';
import 'package:scoute_prime/widgets/common/matches/match_cards/ongoing.dart';
import 'package:scoute_prime/widgets/common/matches/matches_funcs.dart';
import 'package:scoute_prime/widgets/common/searchboxes.dart';
import 'package:scoute_prime/misc/enums.dart';
import 'package:scoute_prime/misc/teams_data.dart';


/// This is the page where the user can view past/ongoing matches.
/// 
/// The matches json data is received from[GetMatches]
/// 
/// TODO: implement filter of what matches it can view, 
/// like what season games or games of a specific team.
class MatchesPageScouting extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MatchesPageScoutingState();
}

class _MatchesPageScoutingState extends State<MatchesPageScouting> 
  with AutomaticKeepAliveClientMixin<MatchesPageScouting> {  

  /// curr filtered matches 
  Map? _scoutingMatches;
  List? _TBAMatches;

  /// filter parameters
  List<TeamsData> _selectedTeams = [];
  List<String> _selectedYears = [];
  List<dynamic> _selectedEvents = [];

  Filter<TeamsData>? _teams;
  Filter<String>? _years;
  Filter<dynamic>? _events;


  final ValueNotifier<bool> _dialogController =
    ValueNotifier<bool>(true);


  Widget get matchCards {
    return _dialogController.value ? Flexible(
      child: ListView(
        shrinkWrap: true,
        
        children: 
          /// # Future matches
          <Widget>[
            for (var match in 
                _scoutingMatches![MatchStates.futureMatches.name] ?? [])
              FutureMatchCard(
                match: match,
              ),
          ] + const [
            SizedBox(
              height: 30,
            ),
          ] +
          /// # Ongoing matches
          [
            for (var match in 
                _scoutingMatches![MatchStates.ongoingMatches.name] ?? [])
              OngoingMatchCard(
                match: match,
              ),
          ] + const [
            SizedBox(
              height: 30,
            ),
          ] +
          /// # Ended matches
          [
            for (var match in 
                _scoutingMatches![MatchStates.endedMatches.name] ?? [])
              EndedMatchCard(
                match: match,
              ),
          ],
      ),
    ) : Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            
            itemCount: _TBAMatches!.length,
            itemBuilder: (context, index) => EndedMatchCard(
              match: _TBAMatches![index],
            ),
          ),
        );
  }

  Future get getAllPageData async {
    _scoutingMatches ??= MatchesFuncs.organizeByState(
      matches: await GetMatches.all()
    );


    _teams ??= Filter(
        items: TeamsData.allTeams,
        selectedItems: _selectedTeams, 
      );
    
    _years ??= Filter(
      items: [for (var i = 1992; i <= DateTime.now().year; i++) i.toString()], 
      selectedItems: _selectedYears,
    );

    if(_dialogController.value == false) {
      _events ??= Filter(
        items: await GetEventsTBA.eventsInYears(_years!.selectedItems.isNotEmpty ? _years!.selectedItems : _years!.items), 
        selectedItems: _selectedEvents,
      );

      _TBAMatches = await GetMatchesTBA.matchesInEvents(_events!.selectedItems);
    }


    return Future.value('done');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _dialogController.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    /// TODO: builds when in nested widget, fix.
    super.build(context);
    
    return Builder(
      builder: (context) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).backgroundColor,

          /// The data is received by a future variable, 
          /// and thus the page is created when the data is not null
          child: FutureBuilder(
            // TODO: add api to get match and teams data
            future: getAllPageData,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                /// The widget displayed when there's data to display
                return Column(
                  children: [
                    /*
                    TODO: in the future, add this
                    MatchesFiltersCard(
                      value: _dialogController.value,
                      onChanged: (value) async {
                        _TBAMatches = await GetMatchesTBA.matchesInEvents(_events!.selectedItems);
                        setState(() {
                        _dialogController.value = value!;
                      });
                      },
                      teams: _teams!,
                      years: _years!,
                      /// TODO: fix bug when trying to get TBA matches. maybe remove TBA matches entirely?
                      events: Filter(
                        items: [], 
                        selectedItems: _selectedEvents,
                      ),
                    ),
                    */

                    matchCards,
                  ],
                );
              }
              else {
                /// The widget displayed when there's no data to display
                return CircularProgressIndicator();
              }
            },
          ),
        );
      }
    );
  }
}