import 'package:http/http.dart' as http;
import 'package:scoute_prime/misc/constants.dart';


class InsertScoutingDataTable2023 {

  static void newTable({
    required matchId,
    required teamId,
    required alliance,
    required startingPosition,
    required wasRobotOnField,
    required didRobotWorkInAuto,
    required didRobotWorkInTeleOp,
    required defenseComments,
    required robotComments,
    required scouterName,
    required didDefendTeleOp,
    required didGetDefendedTeleOp,
    required startingItemOnRobot,

    required autoRowOneCubes,
    required tryAutoRowOneCubes,
    required autoRowTwoCubes,
    required tryAutoRowTwoCubes,
    required autoRowThreeCubes,
    required tryAutoRowThreeCubes,
    required autoRowOneCones,
    required tryAutoRowOneCones,
    required autoRowTwoCones,
    required tryAutoRowTwoCones,
    required autoRowThreeCones,
    required tryAutoRowThreeCones,

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
    required numSecondsBeforeEndPivotedToChargeStation,
    required autoChargeStationStatus,
    required endGameChargeStationStatus,
    required autoNumOfSecondsUntilBalanced,
    required endgameNumOfSecondsUntilBalanced,
    required fromWhereRobotDroveToChargeStation,
    required numOfRobotsOnChargeStation,
    required numOfRobotsOnChargeStationAtEnd,
    required autoDidRobotComeOutOfComunity,
  }) async {
    try {
      /// inserts scouting data 
      final response = await http.post(
        Uri.https(websiteAddress, '/php/new_scouting_data_table.php'),
        body: {
          'id': '',
          'lastChangedAt': '',
          'matchId': '$matchId',
          'teamId': '$teamId',
          'alliance': '$alliance',
          'startingPosition': '$startingPosition',
          'wasRobotOnField': '$wasRobotOnField',
          'didRobotWorkInAuto': '$didRobotWorkInAuto',
          'didRobotWorkInTeleOp': '$didRobotWorkInTeleOp',
          'defenseComments': '$defenseComments',
          'robotComments': '$robotComments',
          'scouterName': '$scouterName',
          'didDefendTeleOp': '$didDefendTeleOp',
          'didGetDefendedTeleOp': '$didGetDefendedTeleOp',
          'startingItemOnRobot': '$startingItemOnRobot',

          'autoRowOneCubes': '$autoRowOneCubes',
          'tryAutoRowOneCubes': '$tryAutoRowOneCubes',
          'autoRowTwoCubes': '$autoRowTwoCubes',
          'tryAutoRowTwoCubes': '$tryAutoRowTwoCubes',
          'autoRowThreeCubes': '$autoRowThreeCubes',
          'tryAutoRowThreeCubes': '$tryAutoRowThreeCubes',
          'autoRowOneCones': '$autoRowOneCones',
          'tryAutoRowOneCones': '$tryAutoRowOneCones',
          'autoRowTwoCones': '$autoRowTwoCones',
          'tryAutoRowTwoCones': '$tryAutoRowTwoCones',
          'autoRowThreeCones': '$autoRowThreeCones',
          'tryAutoRowThreeCones': '$tryAutoRowThreeCones',

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
          'numOfRobotsOnChargeStation': '$numOfRobotsOnChargeStation',
          'autoDidRobotComeOutOfComunity': '$autoDidRobotComeOutOfComunity',
        });
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  } 
}
