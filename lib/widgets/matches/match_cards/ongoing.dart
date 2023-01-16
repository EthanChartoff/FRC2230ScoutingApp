import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/match_cards/team_button.dart';
import 'package:scoute_prime/misc/enums.dart';


/// Card of an Ongoing Match
/// 
/// When tapped, it shows a list of teams from the match, and a scouter/admin 
/// will get a form with data to fill from the match
class OngoingMatchCard extends StatelessWidget {

  /// Match information from the database
  final Map match;  

  /// What will happen when [TeamButton] is hit.
  /// 
  /// In the current version, this is used for routing to the 
  /// scouting forms, and the functions are located in [Routing]
  final void Function() onTapTeamButton;

  const OngoingMatchCard({
    required this.match,
    required this.onTapTeamButton
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
            /// head  
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            iconColor: Colors.black,

            title: Text(
              "Match Number ${match[MatchVars.matchNumber.name]}",
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              "${match[MatchVars.eventKey.name]}, ${match[MatchVars.matchType.name]}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            children: [
              /// body
              SizedBox(
                height: 100,
                child: LayoutBuilder(
                  /// the name of the context is changed because we need to use 
                  builder: (BuildContext noContext, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          /// Red teams
                          children: 
                          List.generate(3, (index) => 
                            TeamButton(
                              parentContext: context, 
                              /// TODO: this is confusing, change database names before 
                              teamNumber: match["redRobot${index+1}"].toString(), 
                              onTap: onTapTeamButton,
                              textStyle: Theme.of(context).textTheme.bodyText1!,
                              width: constraints.maxWidth / 2.5,
                              height: constraints.maxHeight / 3
                            )
                          ),
                        ),
                        Text('VS',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Column(
                          /// Blue teams
                          children: 
                          List.generate(3, (index) => 
                            TeamButton(
                              parentContext: context, 
                              /// TODO: this is confusing, change database names before 
                              /// adding new fetures
                              teamNumber: match["blueRobot${index+1}"].toString(), 
                              onTap: onTapTeamButton,
                              textStyle: Theme.of(context).textTheme.bodyText2!,
                              width: constraints.maxWidth / 2.5,
                              height: constraints.maxHeight / 3
                            )
                          ),
                        ),
                      ]
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}