import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/matches/match_cards/match_cards_funcs.dart';

import 'package:scoute_prime/widgets/common/matches/match_cards/team_button.dart';
import 'package:scoute_prime/misc/enums.dart';


/// Card of an Ongoing Match
/// 
/// When tapped, it shows a list of teams from the match, and a scouter/admin 
/// will get a form with data to fill from the match
class OngoingMatchCard extends StatelessWidget {

  const OngoingMatchCard({
    required this.match,
  });

  /// Match information from the database
  final Map match;  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Theme.of(context).primaryColorDark,
        child: Theme(
          data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
          child: ExpansionTile(     
            leading: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),  
            /// head  
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            iconColor: Colors.black,

            title: Text(
              "Match Number ${match[MatchVars.matchNumber.name]}",
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              '${MatchCardFuncs.getTypeFullName(match['matchType'])}${
                match[MatchVars.eventKey.name] == '' ?
                '' : ', ${match[MatchVars.eventKey.name]}'
              }',
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
                              onTap: () {
                                String path = '${Routing.MATCHES}/${Routing.MATCHES_SCOUTING_FORM}';
                                String matchId = 'matchId=${match['id']}';
                                String teamId = 'teamId=${match["redRobot${index+1}"]}';
                                String alliance = 'alliance=R';
                                String matchNum = 'matchNum=${match[MatchVars.matchNumber.name]}';

                                return context.go('$path?$matchId&$teamId&$alliance&$matchNum');
                              },
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
                              onTap: () {
                                String path = '${Routing.MATCHES}/${Routing.MATCHES_SCOUTING_FORM}';
                                String matchId = 'matchId=${match['id']}';
                                String teamId = 'teamId=${match["redRobot${index+1}"]}';
                                String alliance = 'alliance=R';
                                String matchNum = 'matchNum=${match[MatchVars.matchNumber.name]}';

                                return context.go('$path?$matchId&$teamId&$alliance&$matchNum');
                              },
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