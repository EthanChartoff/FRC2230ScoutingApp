class MatchesFilters {

  /// params:
  ///   matches: ideally a part of match tables from the api
  /// 
  /// returns: same given matches filtered in a map by state name 
  static Future<Map<String, List<dynamic>>> state({
    required Future<List<dynamic>> matches
  }) async {
    Map<String, List<dynamic>> filteredMatches = {
      'endedMatches': [],
      'ongoingMatches': [],
      'futureMatches': []
    };

    for(Map match in await matches) {
      if(match['won_alliance'] == 'OM') {
        filteredMatches['ongoingMatches']!.add(match);
      }
      else {
        filteredMatches['endedMatches']!.add(match);
      }
    }

    print(filteredMatches);
    
    return filteredMatches;
    /// TODO: need to add how to differentiate from ongoing and future
  }
}