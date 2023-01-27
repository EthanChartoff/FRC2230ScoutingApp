import 'package:http/http.dart' as http;

class InsertScoutingDataTable2022 {
  static void newTable({
    required matchId,
    required teamId,
    required didRobotWin,
    required alliance,
    required startingPosition,
    required wasRobotOnField,
    required didRobotWorkInAuto,
    required didRobotWorkInTeleOp,
    required didRobotDefend,
    required wasStrategyDifferent,
    required defenseComments,
    required robotComments,
    required strategyComments,
    required scouterName,
    required autoUpShot,
    required autoUpScored,
    required autoLowShot,
    required autoLowScored,
    required TeleopUpShot,
    required TeleopUpScored,
    required TeleopLowShot,
    required TeleopLowScored,
    required triedToClimbLevel,
    required ClimbLevel,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(
              'http://172.16.14.79/2230_scouting/new_scouting_data_table.php'),
          body: {
            'id': '',
            'lastChangedAt': '',
            'matchId': '$matchId',
            'teamId': '$teamId',
            'didRobotWin': '$didRobotWin',
            'alliance': '$alliance',
            'startingPosition': '$startingPosition',
            'wasRobotOnField': '$wasRobotOnField',
            'didRobotWorkInAuto': '$didRobotWorkInAuto',
            'didRobotWorkInTeleOp': '$didRobotWorkInTeleOp',
            'didRobotDefend': '$didRobotDefend',
            'wasStrategyDifferent': '$wasStrategyDifferent',
            'defenseComments': '$defenseComments',
            'robotComments': '$robotComments',
            'strategyComments': '$strategyComments',
            'scouterName': '$scouterName',
            'autoUpShot': '$autoUpShot',
            'autoUpScored': '$autoUpScored',
            'autoLowShot': '$autoLowShot',
            'autoLowScored': '$autoLowScored',
            'TeleopUpShot': '$TeleopUpShot',
            'TeleopUpScored': '$TeleopUpScored',
            'TeleopLowShot': '$TeleopLowShot',
            'TeleopLowScored': '$TeleopLowScored',
            'triedToClimbLevel': '$triedToClimbLevel',
            'ClimbLevel': '$ClimbLevel',
          });
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
