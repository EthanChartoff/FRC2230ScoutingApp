import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/matches/match_cards/match_cards_funcs.dart';

import 'package:scoute_prime/widgets/common/matches/match_cards/team_button.dart';
import 'package:scoute_prime/misc/enums.dart';

class FutureMatchCard extends StatelessWidget{

  final Map match;  

  const FutureMatchCard({
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
            leading: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
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
                  builder: (_, BoxConstraints constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          /// Red teams
                          children: 
                          List.generate(3, (index) => 
                            TeamButton(
                              parentContext: context, 
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
                        /// Match summary button
                        SizedBox(
                          width: constraints.maxWidth / 5,
                          height: constraints.maxHeight,
              
                          child: TextButton(
                            onPressed: () => context.go(Routing.LOGIN),
                            
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColorDark
                            ),
                            child: Text("MATCH SUMMARY",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            )
                          ),
                        ),
                        Column(
                          /// Blue teams
                          children: 
                          List.generate(3, (index) => 
                            TeamButton(
                              parentContext: context, 
                              teamNumber: match["blueRobot${index+1}"].toString(), 
                              onTap: () {
                                String path = '${Routing.MATCHES}/${Routing.MATCHES_SCOUTING_FORM}';
                                String matchId = 'matchId=${match['id']}';
                                String teamId = 'teamId=${match["blueRobot${index+1}"]}';
                                String alliance = 'alliance=B';
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