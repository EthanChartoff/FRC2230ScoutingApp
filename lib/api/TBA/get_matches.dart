import 'package:http/http.dart' as http;
import 'dart:convert';


/// getters related to matches. All the data is from TBA's API. 
class GetMatchesTBA {

  /// Gets a list of events and returns all of the matches in the event list 
  static Future<List<dynamic>> matchesInEvents(List<dynamic> events) async {
    var jsonData = [];

    try {
      for(var element in events) {
        final response = await http
          .get(Uri.parse("https://www.thebluealliance.com/api/v3/event/${element['key']}/matches/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        jsonData += jsonDecode(response.body);
      }
      
    } catch (err) {
      throw Exception("$err");
    }
    return jsonData;
  }
  
  /// Gets a list of events and returns all of the matches Score Breakdowns 
  /// in the event list 
  static Future<List<dynamic>> matchesScoreBreakdownInEvent(dynamic event) async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.parse("https://www.thebluealliance.com/api/v3/event/${event['key']}/matches?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));

      final body = jsonDecode(response.body);
      for(final element in body.first['score_breakdown']['blue'].keys) {
        jsonData.add(element);
      }
      
    } catch (err) {
      throw Exception("$err");
    }
    return jsonData;
  }

  /// Gets a match key and return its match.
  static Future matchOfKey(String key) async {
    var jsonData;

    try {
      final response = await http
        .get(Uri.parse('https://www.thebluealliance.com/api/v3/match/$key?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq'));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      throw Exception('$err');
    }
    return jsonData;
  }

  /// Gets year (1992 - curr) and a team number, returns all matches in year team 
  /// participated in.
  static Future matchesOfTeamInYear(String team, String year) async {
    var jsonData = [];

    try {
      final response = await http
        .get(Uri.parse('https://www.thebluealliance.com/api/v3/team/frc$team/matches/$year?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq'));
      jsonData = jsonDecode(response.body);
    } catch (err) {
      throw Exception('$err');
    }
    return jsonData;
  }

}


