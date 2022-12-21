import 'package:scoute_prime/variables/enums.dart';

class MatchesFilters {

  /// params:
  ///   matches: ideally a part of match tables from the api
  /// 
  /// returns: same given matches filtered in a map by state name 
  static Future<Map<String, List<dynamic>>> state({
    required Future<List<dynamic>> matches
  }) async {
    Map<String, List<dynamic>> filteredMatches = {
      MatchStates.endedMatches.name: [],
      MatchStates.ongoingMatches.name: [],
      MatchStates.futureMatches.name: []
    };

    for(Map match in await matches) {
      if(match[MatchVars.status.name] == 'OM') {
        filteredMatches[MatchStates.ongoingMatches.name]!.add(match);
      }
      else {
        filteredMatches[MatchStates.endedMatches.name]!.add(match);
      }
    }
    
    return filteredMatches;
    /// TODO: need to add how to differentiate from ongoing and future
  }
}