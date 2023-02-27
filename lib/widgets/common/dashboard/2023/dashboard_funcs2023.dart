import 'package:flutter/material.dart';

class DashboardFuncs2023 {

  /// # ALL
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

  static double precentOfBoolKey(List data, String key) => 
    data.map((e) => int.parse(e[key])).reduce((value, element) => value + element) / 
    data.length;

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

  /// # AUTO
  /// 
  /// Returns a map of if robot worked in auto, if it did, in that key return 
  /// if robot was on the charge station or not. If it didn't work in auto, 
  /// return in that key that it did not work.
  /// 
  /// sf works with lists, so we cant return a map.
  static List<MapEntry<String, int>> autoDidntWorkOrChargeStation(List data) {  
      
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInAuto'] == '1' ? 
        data[index]['autoChargeStationStatus'] == 'DOCKED' 
        || data[index]['autoChargeStationStatus'] == 'ENGAGED'? 
          'On Charge Station' 
          : 'Off Charge Station' 
          : 'Didnt Work'
    );

    return [
      MapEntry('On Charge Station', listWithAllStates.where((element) => 
        element == 'On Charge Station').length),
      MapEntry('Off Charge Station', listWithAllStates.where((element) => 
        element == 'Off Charge Station').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns a map of if robot worked in auto or not.
  static List<MapEntry<String, int>> autoWorked(List data) {
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInAuto'] == '1' ? 
        'Worked' 
        : 'Didnt Work'
    );

    return [
      MapEntry('Worked', listWithAllStates.where((element) => 
        element == 'Worked').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  } 

  /// Returns a map of game items on the robot in the start of the match.
  static List<MapEntry<String, int>> gameItemsOnRobot(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['startingItemOnRobot']
    );

    return [
      MapEntry('CUBE', listWithAllStates.where((element) => 
        element == 'CUBE').length),
      MapEntry('CONE', listWithAllStates.where((element) => 
        element == 'CONE').length),
      MapEntry('NONE', listWithAllStates.where((element) => 
        element == 'NONE').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of robot charge station statuses.
  static List<MapEntry<String, int>> chargeStationStatusAuto(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['autoChargeStationStatus']
    );

    return [
      MapEntry('DOCKED', listWithAllStates.where((element) => 
        element == 'DOCKED').length),
      MapEntry('ENGAGED', listWithAllStates.where((element) => 
        element == 'ENGAGED').length),
      MapEntry('PARKED', listWithAllStates.where((element) => 
        element == 'PARKED').length),
      MapEntry('', listWithAllStates.where((element) => 
        element == 'NONE').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns map of starting positions and how many times they were started in.
  static List<MapEntry<String, int>> startingPosition(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['startingPosition']
    );

    final listWithAllStatesNoEmpty = listWithAllStates.where((element) => element != '');

    return [
      MapEntry('1', listWithAllStatesNoEmpty.where((element) => 
        element.characters.last == '1').length),
      MapEntry('2', listWithAllStatesNoEmpty.where((element) =>
        element.characters.last == '2').length),
      MapEntry('3', listWithAllStatesNoEmpty.where((element) =>
        element.characters.last == '3').length),
    ].where((element) => element.value != 0).toList();
  }

  /// # TELÉOP
  /// 
  /// Returns a map of if robot worked in teleop or not.
  static List<MapEntry<String, int>> teleopWorked(List data) {
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInTeleOp'] == '1' ? 
        'Worked' 
        : 'Didnt Work'
    );

    return [
      MapEntry('Worked', listWithAllStates.where((element) => 
        element == 'Worked').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  }

  /// # ENDGAME
  /// 
  /// Returns a map of if robot worked in teleop, if it did, in that key return 
  /// if robot was on the charge station or not. If it didn't work in teleop, 
  /// return in that key that it did not work. 
  static List<MapEntry<String, int>> endgameDidntWorkOrChargeStation(List data) {    
    final listWithAllStates = List.generate(data.length, (index) => 
      data[index]['didRobotWorkInTeleOp'] == '1' ? 
        data[index]['autoChargeStationStatus'] == 'DOCKED' 
        || data[index]['autoChargeStationStatus'] == 'ENGAGED'? 
          'On Charge Station' 
          : 'Off Charge Station' 
          : 'Didnt Work'
    );

    return [
      MapEntry('On Charge Station', listWithAllStates.where((element) => 
        element == 'On Charge Station').length),
      MapEntry('Off Charge Station', listWithAllStates.where((element) => 
        element == 'Off Charge Station').length),
      MapEntry('Didnt Work', listWithAllStates.where((element) => 
        element == 'Didnt Work').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of robot charge station statuses.
  static List<MapEntry<String, int>> chargeStationStatusEndgame(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['endGameChargeStationStatus']
    );

    return [
      MapEntry('DOCKED', listWithAllStates.where((element) => 
        element == 'DOCKED').length),
      MapEntry('ENGAGED', listWithAllStates.where((element) => 
        element == 'ENGAGED').length),
      MapEntry('PARKED', listWithAllStates.where((element) => 
        element == 'PARKED').length),
      MapEntry('NONE', listWithAllStates.where((element) => 
        element == 'NONE').length),
    ].where((element) => element.value != 0).toList();
  }

  /// Returns number of where robot drove to charge station.
  static List<MapEntry<String, int>> fromWhereRobotDroveToChargeStation(List data) {
    final listWithAllStates = List<String>.generate(data.length, (index) => 
      data[index]['fromWhereRobotDroveToChargeStation']
    );

    return [
      MapEntry('COMUNITY', listWithAllStates.where((element) => 
        element == 'COMUNITY').length),
      MapEntry('OUT', listWithAllStates.where((element) => 
        element == 'OUT').length),
    ].where((element) => element.value != 0).toList();
  }

  /// # STRATEGY
  
  static List<Map<String, dynamic>> strategyDataByRound(List strategy, List matches) {
    return strategy.map((e) {
      final matchOfStrategyData = 
        matches.firstWhere((match) => match['id'] == e['matchId']);

      return {
        'round': matchOfStrategyData['matchNumber'],
        'strategy': e,
      };      
    }).toList();
  }


}