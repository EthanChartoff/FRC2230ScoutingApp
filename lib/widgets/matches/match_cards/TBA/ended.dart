import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/widgets/matches/match_cards/team_button.dart';
import 'package:scoute_prime/misc/routing.dart';


/// Card of an Ended match from the TBA's API 
/// 
/// When tapped, shows table of teams in match, and a button to show match summary,
/// when team/match summery button is tapped, page will build a summary of team/match.
class TBAEndedMatchCard extends StatelessWidget{

  const TBAEndedMatchCard({
    required this.match,
  });

  /// Ended match informatio.
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
            /// head  
            collapsedTextColor: Colors.white,
            textColor: Colors.white,
            iconColor: Colors.black,

            title: Text(
              '${match['key']}',
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              "${match['event_key']}",
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
                          List.generate(3, (index) {
                            final teamNumber = match['alliances']['red']['team_keys'][index].toString().substring(3);
                            return TeamButton(
                              parentContext: context, 
                              teamNumber: teamNumber, 
                              /// TODO: when routing into page, page sometimes need information,
                              /// change router to have information with page 
                              /// (idealy with get url vars in php or MaterialPageRoute)
                              onTap: () => context.go('${Routing.MATCHES}/${Routing.MATCHES_DASHBOARD}?key=${match['key']}'),
                              textStyle: Theme.of(context).textTheme.bodyText1!,
                              width: constraints.maxWidth / 2.5,
                              height: constraints.maxHeight / 3
                            );
                          }),
                        ),
                        /// Match summary button
                        SizedBox(
                          width: constraints.maxWidth / 5,
                          height: constraints.maxHeight,
              
                          child: TextButton(
                            onPressed: () => context.go('${Routing.MATCHES}/${Routing.MATCHES_DASHBOARD}?key=${match['key']}'),
                            
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
                          List.generate(3, (index) {
                            final teamNumber = match['alliances']['blue']['team_keys'][index].toString().substring(3);
                            return TeamButton(
                              parentContext: context, 
                              teamNumber: teamNumber, 
                              /// TODO: when routing into page, page sometimes need information,
                              /// change router to have information with page 
                              /// (idealy with get url vars in php or MaterialPageRoute)
                              onTap: () => context.go('${Routing.MATCHES}/${Routing.MATCHES_DASHBOARD}?key=${match['key']}'),
                              textStyle: Theme.of(context).textTheme.bodyText2!,
                              width: constraints.maxWidth / 2.5,
                              height: constraints.maxHeight / 3
                            );
                          }),
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