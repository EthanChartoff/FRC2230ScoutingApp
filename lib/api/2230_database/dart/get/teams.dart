import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoute_prime/misc/constants.dart';

/// TODO: class my need to be abstract, change name to a more sutible one
/// and add more filter getters
class GetTeamsData {

  static Future<List<dynamic>> all() async {
    var jsonData = [];

    try {
      final response = await http
          .get(Uri.parse("$websiteUrl/php/teams.php"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }

  /// update picklist indexes
  static void updatePicklistIndexes({
    required List<Map<String, dynamic>> teamsPos1,
    required List<Map<String, dynamic>> teamsPos2
  }) async {
    try {
      final response = await http.post(Uri.parse("$websiteUrl/php/update_picklist.php"),
          body: {
            'pos1': jsonEncode(teamsPos1),
            'pos2': jsonEncode(teamsPos2),
          });
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
  }

}


