import 'package:flutter/material.dart';

import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/TBA/get_event.dart';
import 'package:scoute_prime/api/TBA/get_matches.dart';
import 'package:scoute_prime/widgets/matches/filters_card.dart';
import 'package:scoute_prime/widgets/matches/match_cards/TBA/ended.dart';
import 'package:scoute_prime/widgets/matches/match_cards/ended.dart';
import 'package:scoute_prime/widgets/matches/matches_funcs.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';
import 'package:scoute_prime/misc/enums.dart';
import 'package:scoute_prime/misc/teams_data.dart';


/// This is the page where the user can view past/ongoing matches.
/// 
/// The matches json data is received from[GetMatches]
/// 
/// TODO: implement filter of what matches it can view, 
/// like what season games or games of a specific team.
class MatchesPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {  

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
    ValueNotifier<bool>(false);


  Widget matchCards(bool flag) {
    return flag ? Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        
        itemCount: _scoutingMatches![MatchStates.ongoingMatches.name]!.length,
        itemBuilder: (context, index) => EndedMatchCard(
          match: _scoutingMatches![MatchStates.ongoingMatches.name]![index],
        ),
      ),
    ) : Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            
            itemCount: _TBAMatches!.length,
            itemBuilder: (context, index) => TBAEndedMatchCard(
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
      items: await GetEventsTBA.allYears(), 
      selectedItems: _selectedYears,
    );

    _events ??= Filter(
      items: await GetEventsTBA.eventsInYears(_years!.selectedItems.isNotEmpty ? _years!.selectedItems : _years!.items), 
      selectedItems: _selectedEvents,
    );

    _TBAMatches = await GetMatchesTBA.matchesInEvents(_events!.selectedItems);

    return Future.value('done');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dialogController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  events: _events!,
                ),

                matchCards(_dialogController.value),
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

}