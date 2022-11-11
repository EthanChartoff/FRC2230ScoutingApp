import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/match_cards/ended.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';
import 'package:scoute_prime/variables/enums.dart';


/// Layout of match cards a viewer can see 
class ViewerMatches extends StatelessWidget{
  /// All ended matches that will be displayed
  final List<dynamic> endedMatches;

  const ViewerMatches({
    required this.endedMatches
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
        /// ended matches
        ListView.builder(
          itemBuilder: (context, index) => EndedMatchCard(
            match: endedMatches[index],
          ),
          itemCount: endedMatches.length,
          shrinkWrap: true,
        ),
      ]
    );
  }

  static Widget builder({required Map<String, List<dynamic>> matches}) => 
    ViewerMatches(
      endedMatches: matches[MatchStates.endedMatches.name]!
    );
}



