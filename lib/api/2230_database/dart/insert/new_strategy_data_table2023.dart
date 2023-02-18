import 'package:http/http.dart' as http;

class InsertStrategyDataTable2023 {
  static void newTable({
    required matchId,
    required teamId,
    required alliance,
    required gathering,
    required cargo,
    required scoring,
    required defenceOnOtherRobots,
    required defenceOnThemselves,
    required drivers,
    required comments,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(
              'http://192.168.1.47/2230_scouting/new_strategy_data_table.php'),
          body: {
            'id': '',
            'lastChangedAt': '',
            'matchId': '$matchId',
            'teamId': '$teamId',
            'alliance': '$alliance',
            'gathering': '$gathering',
            'cargo': '$cargo',
            'scoring': '$scoring',
            'defenceOnOtherRobots': '$defenceOnOtherRobots',
            'defenceOnThemselves': '$defenceOnThemselves',
            'drivers': '$drivers',
            'comments': '$comments',
          });
        // print(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
