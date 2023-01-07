import 'package:http/http.dart' as http;
import 'dart:convert';

/// TODO: class my need to be abstract, change name to a more sutible one
/// and add more filter getters
class GetTeamsData {

  static Future<List<dynamic>> all() async {
    var jsonData = [];

    try {
      final response = await http
          .get(Uri.parse("http://localhost/2230_scouting/teams.php"));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }

    return jsonData;
  }

}


