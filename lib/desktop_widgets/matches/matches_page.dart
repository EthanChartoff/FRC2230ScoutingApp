import 'package:flutter/material.dart';
import 'package:scoute_prime/api/gets_match_table.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches_filters.dart';
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
  final Widget Function({required Map<String, List<dynamic>> matches}) bodyBuilder;

  MatchesPage({
    required this.bodyBuilder
  });

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
            /// The widget displayed when there's data to display
            return widget.bodyBuilder(
              matches: snapshot.data!
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