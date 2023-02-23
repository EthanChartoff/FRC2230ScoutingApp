import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoute_prime/misc/constants.dart';

class GetMatches {

  static Future<List<dynamic>> all() async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.http(websiteAddress, '/php/all_matches_tables.php'));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
        throw Exception(err);
    }
    return jsonData;
  }

  static Future<List<dynamic>> ofTeam(String teamId) async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.parse("$websiteUrl/php/get_scouting_table_of_teamId.php?teamId=$teamId"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }
}


