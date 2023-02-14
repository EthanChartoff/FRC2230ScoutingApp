class DashboardFuncs2023 {

  /// Gets scouting tables, matches and key, returns a map of key value 
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

  /// Gets scouting tables, key and optionaly a 0 title and 1 title,
  /// returns a map of how much bool key values are for each value (0 or 1) in 
  /// tables.
  static List<MapEntry<String, int>> booleanValueByKey(List data, String key, 
    [String title0 = 'no', String title1 = 'yes']) {
      final listWithAllStates = List.generate(data.length, (index) => 
        data[index][key] == '0' ? title0 : title1
      );

      return [
        MapEntry(title0, 
          listWithAllStates.where((element) => element == title0).length),
        MapEntry(title1, 
          listWithAllStates.where((element) => element == title1).length),
      ].where((element) => element.value != 0).toList();
  } 

  /// gets series, point index and data (from a builder), returns a string with 
  /// series point index value and its percent of the total data length.
  static String dataLabelPrecent(series, pointIndex, data) => 
    '${series.dataSource[pointIndex].value} (${(series.dataSource[pointIndex].value / data['scoutingTables'].length * 100).toStringAsFixed(2)}%)';

  /// gets scouting tables two keys, returns ratio of sum values of key1 and key2.
  static double ratioOfTwoKeys(List data, String key1, String key2) => 
    data.map((e) => int.parse(e[key1])).reduce((value, element) => value + element) / 
    data.map((e) => int.parse(e[key2])).reduce((value, element) => value + element);

  /// gets value, and if its NaN returns 0, else returns value.
  static double valOrNan(double value) => value.isNaN ? 0 : value;
}