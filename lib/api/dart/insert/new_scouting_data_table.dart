import 'package:http/http.dart' as http;


class InsertScoutingDataTable {

  static void newTable({
    required matchId,
    required teamId,
    required didWin,
    required alliance,
    required startingPos,
    required wasRobotOnField,
    required didRobotWorkInAuto,
    required didRobotWorkInTP,
    required didDefend,
    required wasStrategyDifferent,
    required defenseComments,
    required robotComments,
    required strategyComments,
    required scouterName
  }) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost/2230_scouting/new_scouting_data_table.php"),
        body: {
          "id": "",
          "match_id" : "$matchId",
          "team_id" : "$teamId",
          "did_win" : "$didWin",
          "alliance" : "$alliance",
          "starting_position" : "$startingPos",
          "was_robot_on_field" : "$wasRobotOnField",
          "did_robot_work_in_auto" : "$didRobotWorkInAuto",
          "did_robot_work_in_teleop" : "$didRobotWorkInTP",
          "did_robot_defend" : "$didDefend",
          "was_strategy_different" : "$wasStrategyDifferent",
          "defense_comments" : "$defenseComments",
          "robot_comments" : "$robotComments",
          "strategy_comments" : "$strategyComments",
          "scouter_name" : "$scouterName",
          "created_at" : ""
        }
      );
    } catch (err) {
      // print("$err lol");
      throw Exception("$err");
    }
  }
}