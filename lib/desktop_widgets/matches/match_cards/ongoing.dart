import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/user_type_builder.dart';
import 'package:scoute_prime/variables/enums.dart';

/// Card of an Ongoing Match
/// 
/// When tapped, it shows a list of teams from the match, and a scouter/admin 
/// will get a form with data to fill from the match
class OngoingMatchCard extends StatelessWidget{

  /// ongoing matches information, filtered from all matches
  dynamic match;  

  OngoingMatchCard({
    required this.match
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Theme.of(context).primaryColorDark,
        child: Theme(
          data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
          child: ExpansionTile(        
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            iconColor: Colors.black,

            title: Text(
              "Match Number ${match[MatchVars.match_number.name]}",
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              "${match[MatchVars.competition.name]}, ${match[MatchVars.match_type.name]}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}