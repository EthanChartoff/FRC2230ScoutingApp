// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:scoute_prime/desktop_widgets/matches/match_cards/ended.dart';
// import 'package:scoute_prime/desktop_widgets/matches/match_cards/ongoing.dart';

// import '../../variables/enums.dart';

// /// Orgenizes scouter matches in a listview 
// class Matches extends StatefulWidget {

//   /// json of matches
//   final dynamic matchesData; 

//   Matches({
//     required this.matchesData
//   });
  
//   @override
//   State<StatefulWidget> createState() => _MatchesState();
// }

// class _MatchesState extends State<Matches>{
//   List<dynamic>? _ongoingMatchesData;
//   List<dynamic>? _endedMatchesData;

//   Future filterMatches(var matches) {
//     List<dynamic> _ongoingMatches = [];
//     List<dynamic> _endedMatches = [];
//     for(Map match in matches) {
//       if(match['won_alliance'] == 'OM') {
//         _ongoingMatches.add(match);
//       }
//       else {
//         _endedMatches.add(match);
//       }
//     }
//     setState(() {
//       _ongoingMatchesData = _ongoingMatches;
//       _endedMatchesData = _endedMatches;
//     });

//     return Future.value("done");
//   }

//   @override
//   Widget build(BuildContext context) {
    
//     return FutureBuilder(
//       future: filterMatches(widget.matchesData),
//       builder: (context, snapshot) {
//         if(snapshot.hasData) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               OngoingMatchCard(
//                 matches: _ongoingMatchesData!             
//               ),
//               const SizedBox(
//                 height: 200,
//               ),
//               EndedMatchCard(
//                 matches: _endedMatchesData!
//               )
//             ]
//           );
//         }
//         else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }

//   /// TODO: make this more dynamic. make _ongoingMatches and _endedMatches theyre own widgets 
//   /// so they can be implemented in viewer, scouter and admin pages
//   /// TODO: every time expansion tile opens, a filter matches is activated. if we have alot of matches this 
//   /// is not efficient, maybe fix that if its a bother
// }

  



