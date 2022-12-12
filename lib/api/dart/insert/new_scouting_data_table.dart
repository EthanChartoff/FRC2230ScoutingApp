import 'package:http/http.dart' as http;

class InsertScoutingDataTable {
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
    required scouterName
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
            'http://localhost/2230_scouting/new_scouting_data_table.php'),
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
          'scouterName': '$scouterName'
        }
      );
      print(response.body.toString());
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
