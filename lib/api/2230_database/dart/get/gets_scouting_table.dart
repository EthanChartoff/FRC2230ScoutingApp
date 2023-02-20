import 'package:http/http.dart' as http;
import 'dart:convert';


class GetScoutingData {

  static Future<List<dynamic>> all() async {
    var jsonData = [];

    try {
      final response = await http
          .get(Uri.parse("http://172.16.14.79/2230_scouting/all_souting_tables.php"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }

  static Future<List<dynamic>> fromMatchId(String matchId) async {
    var jsonData = [];
    
    try {
      final response = await http
          .get(Uri.parse("http://172.16.14.79/2230_scouting/get_scouting_table_of_matchId.php?matchId=$matchId"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }

  static Future<List<dynamic>> fromTeamId(String teamId) async {
    var jsonData = [];
    
    try {
      final response = await http
          .get(Uri.parse("http://172.16.14.79/2230_scouting/scouting_tables_of_team.php?teamId=$teamId"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }
  
}


