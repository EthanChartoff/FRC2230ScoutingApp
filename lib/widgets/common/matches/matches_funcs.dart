import 'package:scoute_prime/misc/enums.dart';

class MatchesFuncs {

  /// params:
  ///   matches: ideally a part of match tables from the api
  /// 
  /// returns: same given matches filtered in a map by state name 
  static Map<String, List<dynamic>> organizeByState({
    required List<dynamic> matches
  }) {
    Map<String, List<dynamic>> filteredMatches = {
      MatchStates.endedMatches.name: [],
      MatchStates.ongoingMatches.name: [],
      MatchStates.futureMatches.name: []
    };
    for(Map match in matches) {
      /// if match is ongoing
      if(match[MatchVars.matchStatus.name] == 'OM') {
        filteredMatches[MatchStates.ongoingMatches.name]!.add(match);
      }
      else if(match[MatchVars.matchStatus.name] == 'FM') {
        filteredMatches[MatchStates.futureMatches.name]!.add(match);
      }
      else {
        filteredMatches[MatchStates.endedMatches.name]!.add(match);
      }
    }    
    return filteredMatches;
    /// TODO: need to add how to differentiate from ongoing and future
  }
}