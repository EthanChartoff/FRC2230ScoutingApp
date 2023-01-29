import 'package:http/http.dart' as http;


class InsertScoutingDataTable2023 {

  static void newTable({
    required matchId,
    required teamId,
    required alliance,
    required winLoseOrTie,
    required startingPosition,
    required wasRobotOnField,
    required didRobotWorkInAuto,
    required didRobotWorkInTeleOp,
    required defenseComments,
    required robotComments,
    required scouterName,
    required didDefendTeleOp,
    required didGetDefendedTeleOp,
    required didDefendEndGame,
    required didGetDefendedEndGame,
    required startingItemOnRobot,
    required rowOneCubes,
    required tryRowOneCubes,
    required rowTwoCubes,
    required tryRowTwoCubes,
    required rowThreeCubes,
    required tryRowThreeCubes,
    required rowOneCones,
    required tryRowOneCones,
    required rowTwoCones,
    required tryRowTwoCones,
    required rowThreeCones,
    required tryRowThreeCones,
    required didFeed,
    required numOfCubesGatheredIntoComunity,
    required numOfConesGatheredIntoComunity,
    required numOfSecondsOnChargeStation,
    required numSecondsBeforeEndPivotedToChargeStation,
    required autoChargeStationStatus,
    required endGameChargeStationStatus,
    required autoNumOfSecondsUntilBalanced,
    required endgameNumOfSecondsUntilBalanced,
    required fromWhereRobotDroveToChargeStation,
    required numOfRobotsOnChargeStationAtEnd,
    required autoDidRobotComeOutOfComunity,
  }) async {
    try {
      /// inserts scouting data 
      final response = await http.post(
        Uri.parse(
            'http://172.16.14.79/2230_scouting/new_scouting_data_table.php'),
        body: {
          'id': '',
          'lastChangedAt': '',
          'matchId': '$matchId',
          'teamId': '$teamId',
          'alliance': '$alliance',
          'winLoseOrTie': '$winLoseOrTie',
          'startingPosition': '$startingPosition',
          'wasRobotOnField': '$wasRobotOnField',
          'didRobotWorkInAuto': '$didRobotWorkInAuto',
          'didRobotWorkInTeleOp': '$didRobotWorkInTeleOp',
          'defenseComments': '$defenseComments',
          'robotComments': '$robotComments',
          'scouterName': '$scouterName',
          'didDefendTeleOp': '$didDefendTeleOp',
          'didGetDefendedTeleOp': '$didGetDefendedTeleOp',
          'didDefendEndGame': '$didDefendEndGame',
          'didGetDefendedEndGame': '$didGetDefendedEndGame',
          'startingItemOnRobot': '$startingItemOnRobot',
          'rowOneCubes': '$rowOneCubes',
          'tryRowOneCubes': '$tryRowOneCubes',
          'rowTwoCubes': '$rowTwoCubes',
          'tryRowTwoCubes': '$tryRowTwoCubes',
          'rowThreeCubes': '$rowThreeCubes',
          'tryRowThreeCubes': '$tryRowThreeCubes',
          'rowOneCones': '$rowOneCones',
          'tryRowOneCones': '$tryRowOneCones',
          'rowTwoCones': '$rowTwoCones',
          'tryRowTwoCones': '$tryRowTwoCones',
          'rowThreeCones': '$rowThreeCones',
          'tryRowThreeCones': '$tryRowThreeCones',
          'didFeed': '$didFeed',
          'numOfCubesGatheredIntoComunity': '$numOfCubesGatheredIntoComunity',
          'numOfConesGatheredIntoComunity': '$numOfConesGatheredIntoComunity',
          'numOfSecondsOnChargeStation': '$numOfSecondsOnChargeStation',
          'numSecondsBeforeEndPivotedToChargeStation':
              '$numSecondsBeforeEndPivotedToChargeStation',
          'autoChargeStationStatus': '$autoChargeStationStatus',
          'endGameChargeStationStatus': '$endGameChargeStationStatus',
          'autoNumOfSecondsUntilBalanced': '$autoNumOfSecondsUntilBalanced',
          'endgameNumOfSecondsUntilBalanced':
              '$endgameNumOfSecondsUntilBalanced',
          'fromWhereRobotDroveToChargeStation':
              '$fromWhereRobotDroveToChargeStation',
          'numOfRobotsOnChargeStationAtEnd':
              '$numOfRobotsOnChargeStationAtEnd',
          'autoDidRobotComeOutOfComunity': '$autoDidRobotComeOutOfComunity',
        });
      print(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  } 
}
