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
    required scouterName,
    required shotCounter1,
    required shotCounter2,
    required dropdownButton,
    required textfield,
    required checkbox,
    required buttonTimer,
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
            'scouterName': '$scouterName',
            'shotCounter1': '$shotCounter1',
            'shotCounter2': '$shotCounter2',
            'dropdownButton': '$dropdownButton',
            'textfield': '$textfield',
            'checkbox': '$checkbox',
            'buttonTimer': '$buttonTimer',
          });
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
