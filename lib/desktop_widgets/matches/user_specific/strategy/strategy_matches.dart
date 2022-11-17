import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/match_cards/ended.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';
import 'package:scoute_prime/variables/enums.dart';

/// Layout of match cards a strategy member can see 
class StrategyMatches extends StatelessWidget{
  /// All future matches that will be displayed
  final List<dynamic> futureMatches;

  /// All ongoing matches that will be displayed
  final List<dynamic> ongoingMatches;

  /// All ended matches that will be displayed
  final List<dynamic> endedMatches;

  /// What will happen when [TeamButton] is hit.
  /// 
  /// In the current version, this is used for routing to the 
  /// scouting forms, and the functions are located in [Routing]
  final void Function() onTapTeamButton;


  const StrategyMatches({
    required this.futureMatches,
    required this.ongoingMatches,
    required this.endedMatches,
    required this.onTapTeamButton
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Future Matches",
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) => OngoingMatchCard(
            match: futureMatches[index],
            onTapTeamButton: onTapTeamButton,
          ),
          itemCount: futureMatches.length,
          shrinkWrap: true,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Ongoing Matches",
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) => OngoingMatchCard(
            match: futureMatches[index],
            onTapTeamButton: onTapTeamButton,
          ),
          itemCount: ongoingMatches.length,
          shrinkWrap: true,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Ended Matches",
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        ListView.builder(
          itemBuilder: (context, index) => EndedMatchCard(
            match: futureMatches[index],
            onTapTeamButton: onTapTeamButton,
          ),
          itemCount: endedMatches.length,
          shrinkWrap: true,
        ),


      ]
    );
  }

  static Widget builder({
    required Map<String, List<dynamic>> matches,
    required void Function() onTapTeamButton
    }) => 
      StrategyMatches(
        futureMatches: matches[MatchStates.futureMatches.name]!,
        ongoingMatches: matches[MatchStates.ongoingMatches.name]!,
        endedMatches: matches[MatchStates.endedMatches.name]!,
        onTapTeamButton: onTapTeamButton,
      );
}



