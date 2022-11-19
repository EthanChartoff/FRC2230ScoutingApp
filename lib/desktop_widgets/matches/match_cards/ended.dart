import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/team_button.dart';
import 'package:scoute_prime/variables/enums.dart';


/// Card of an Ended match
/// 
/// When tapped, shows table of teams in match, and a button to show match summary,
/// when tapped, page will build a summary of team/match.
class EndedMatchCard extends StatelessWidget{

  /// ended matches information, filtered from all matches
  final Map match;  

  /// What will happen when [TeamButton] is hit.
  /// 
  /// In the current version, this is used for routing to the 
  /// scouting forms, and the functions are located in [Routing]
  final void Function() onTapTeamButton;

  const EndedMatchCard({
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
              "Match Number ${match[MatchVars.match_number.name]}",
              style: Theme.of(context).textTheme.headline1,
            ),
            subtitle: Text(
              "${match[MatchVars.competition.name]}, ${match[MatchVars.match_type.name]}",
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
                              teamNumber: match["red_robot_${index + 1}"].toString(), 
                              onTap: onTapTeamButton,
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
                            onPressed: () => Navigator.pushNamed(context, 'match-info'),
                            
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
                              teamNumber: match["blue_robot_${index + 1}"].toString(), 
                              /// TODO: when routing into page, page sometimes need information,
                              /// change router to have information with page 
                              /// (idealy with get url vars in php or MaterialPageRoute)
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