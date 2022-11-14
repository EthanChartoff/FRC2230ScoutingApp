import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/match_cards/ended.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';
import 'package:scoute_prime/variables/enums.dart';


/// Layout of match cards a scouter can see 
class ScoutingMatches extends StatelessWidget{
  /// All ongoing matches that will be displayed
  final List<dynamic> ongoingMatches;

  /// All ended matches that will be displayed
  final List<dynamic> endedMatches;

  /// What will happen when [TeamButton] is hit.
  /// 
  /// In the current version, this is used for routing to the 
  /// scouting forms, and the functions are located in [Routing]
  final void Function() onTapTeamButton;

  const ScoutingMatches({
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
          child: Text("Ongoing Matches",
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        /// ongoing matches
        ListView.builder(
          itemBuilder: (context, index) => OngoingMatchCard(
            match: ongoingMatches[index],
            onTapTeamButton: onTapTeamButton,
          ),
          itemCount: ongoingMatches.length,
          shrinkWrap: true,
        ),

        const SizedBox(
          height: 150,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Ended Matches",
            style: Theme.of(context).textTheme.headline2
          ),
        ),
        /// ended matches
        ListView.builder(
          itemBuilder: (context, index) => EndedMatchCard(
            match: endedMatches[index],
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
      ScoutingMatches(
        ongoingMatches: matches[MatchStates.ongoingMatches.name]!,
        endedMatches: matches[MatchStates.endedMatches.name]!,
        onTapTeamButton: onTapTeamButton,
      );
}



