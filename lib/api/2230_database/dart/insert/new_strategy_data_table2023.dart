import 'package:http/http.dart' as http;
import 'package:scoute_prime/misc/constants.dart';

class InsertStrategyDataTable2023 {
  static void newTable(
      {required matchId,
      required teamId,
      required alliance,
      required gathering,
      required cargo,
      required scoring,
      required defenceOnOtherRobots,
      required defenceOnThemselves,
      required drivers,
      required comments,
      required auto,
      required chargeStation}) async {
    try {
      final response = await http.post(
          Uri.parse('$websiteUrl/php/new_strategy_data_table.php'),
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
            'auto': '$auto',
            'chargeStation': '$chargeStation',
          });
      // print(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }

  static void newTableNoMatch({
    required teamId,
    required gathering,
    required cargo,
    required scoring,
    required defenceOnOtherRobots,
    required defenceOnThemselves,
    required drivers,
    required comments,
    required auto,
    required chargeStation
    }) async {
    try {
      final response = await http.post(
          Uri.parse('$websiteUrl/php/new_no_match_strategy_data_table.php'),
          body: {
            'id': '',
            'lastChangedAt': '',
            'teamId': '$teamId',
            'gathering': '$gathering',
            'cargo': '$cargo',
            'scoring': '$scoring',
            'defenceOnOtherRobots': '$defenceOnOtherRobots',
            'defenceOnThemselves': '$defenceOnThemselves',
            'drivers': '$drivers',
            'comments': '$comments',
            'auto': '$auto',
            'chargeStation': '$chargeStation'
          });
      // print(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
