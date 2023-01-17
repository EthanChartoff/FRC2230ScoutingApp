import 'package:http/http.dart' as http;
import 'dart:convert';


class GetStrategyData {
  
  static Future<List<dynamic>> ofTeam(String team) async {
    var jsonData = [];

    try {
      final response = await http
          .get(Uri.parse("http://localhost/2230_scouting/strategy_data_of_team.php?teamId=$team"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }
}