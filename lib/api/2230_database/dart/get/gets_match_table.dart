import 'package:http/http.dart' as http;
import 'dart:convert';

/// TODO: class my need to be abstract, change name to a more sutible one
/// and add more filter getters
class GetMatches {

  static Future<List<dynamic>> all() async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.parse("http://192.168.1.47/2230_scouting/all_matches_tables.php"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
    return jsonData;
  }

  static Future<List<dynamic>> ofTeam(String teamId) async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.parse("http://localhost/2230_scouting/get_scouting_table_of_teamId.php?teamId=$teamId"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }
}


