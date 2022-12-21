import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import 'package:scoute_prime/api/dart/get/gets_match_table.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ended.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches_filters.dart';
import 'package:scoute_prime/desktop_widgets/matches/match_cards/team_button.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/variables/enums.dart';

/// This is the page where the user can view past/ongoing matches.
/// 
/// The matches json data is received from[GetMatches]
/// 
/// TODO: implement filter of what matches it can view, 
/// like what season games or games of a specific team.
class MatchesPage extends StatefulWidget{

  /// The body. Supposed to handles how to view matches
  /// according to user type. 
  /// 
  /// This is a Function and not a Widget because you cant insert required
  /// params from a child widget when inhereted from the parent, so we build
  /// the widget with the data in this widget
  // final Widget Function({
  //   required Map<String, List<dynamic>> matches,
  //   required void Function(String) onTapTeamButton
  // }) bodyBuilder;

  /// What will happen when [TeamButton] is hit.
  /// 
  /// In the current version, this is used for routing to the 
  /// scouting forms, and the functions are located in [Routing]


  Widget filters(Map<String, List<dynamic>> data) => SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
          
           filterCheckbox(title: 'lol'),

           filterCheckbox(title: 'lol2')
          ],
        )
      ],
    ),
  );

  Widget filterCheckbox({
    required String title
  }) => Material(
    child: SizedBox(
      width: 150,
      child: CheckboxListTile(
        onChanged: (value) {
          
        },
        value: false,
        title: Text(title),
      ),
    ),
  );

  @override
  State<StatefulWidget> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage>{  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,

      /// The data is received by a future variable, 
      /// and thus the page is created when the data is not null
      child: FutureBuilder(
        // TODO: add api to get match and teams data
        future: MatchesFilters.state(
          matches: GetMatches.all()
        ),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print(snapshot.data![MatchStates.endedMatches.name]![0]);
            /// The widget displayed when there's data to display
            return Row(
              children: [
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    
                    itemCount: snapshot.data![MatchStates.endedMatches.name]!.length,
                    itemBuilder: (context, index) => EndedMatchCard(
                      match: snapshot.data![MatchStates.endedMatches.name]![index],
                    ),
                  ),
                ),

                widget.filters(snapshot.data!),
              ],
            );
          }
          else {
            /// The widget displayed when there's no data to display
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

}