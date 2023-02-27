import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scoute_prime/misc/constants.dart';


class GetNoMatchStrategyData {
  
  static Future<List<dynamic>> ofTeam(String team) async {
    var jsonData = [];

    try {
      final response = await http.get(
        Uri.http(websiteAddress, 
        '/php/no_match_strategy_data_of_team.php', 
        {'teamId' : team})
      );
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }
}