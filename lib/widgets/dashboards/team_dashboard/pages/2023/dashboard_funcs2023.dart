class DashboardFuncs2023 {

  /// Gets scouting tables and matches, returns a map of ['rowOneCubes'] value 
  /// in the scouting tables with its corresponding match number (the scouting 
  /// table and are matching if matchId of table and id of match are the same).
  static List<MapEntry<int, T>> valueByRound<T>(List data, List matches, String key) {
    final List lst = List<T>.generate(data.length, (index) {
      if(T == double) return double.parse(data[index][key]) as T;
      if(T == String) return data[index][key] as T;
      return int.parse(data[index][key]) as T;
    });


    final matchNumbers = List.generate(data.length, (index) => 
      int.parse(matches.firstWhere((element) => 
        element['id'] == data[index]['matchId']
      )['matchNumber'])
    );
    matchNumbers.sort();

    return List.generate(data.length, (index) => 
      MapEntry<int, T>(matchNumbers[index], lst[index] as T)
    );
  }
}