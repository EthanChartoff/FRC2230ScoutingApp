import 'package:flutter/material.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';

class ScoutingMatches extends StatelessWidget{

  /// The given match data. only ended and ongoing matches need to be displayed (for now)
  final List<dynamic> matches;

  const ScoutingMatches({
    required this.matches
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(matches.length, (index) => 
        OngoingMatchCard(match: matches[index])),
    );
  }

  static Widget builder(List<dynamic> matches) => 
    ScoutingMatches(matches: matches);
}



