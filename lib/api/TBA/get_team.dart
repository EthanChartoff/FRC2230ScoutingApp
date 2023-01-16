import 'package:http/http.dart' as http;
import 'dart:convert';

/// TODO: class my need to be abstract, change name to a more sutible one
/// and add more filter getters
class GetTeamsTBA {

  static Future<List<dynamic>> allSimple() async {
    var jsonData = [];
    int pageIndex = 0;

    try {
      while(true) {
        var response = await http
         .get(Uri.parse("https://www.thebluealliance.com/api/v3/teams/$pageIndex/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        
        if(!response.body.toString().contains('city')) {
          break;
        }
        pageIndex++;
        jsonData += jsonDecode(response.body);
      }
    } catch (err) {
      throw Exception('$err');
    }
    return jsonData;
  }

  static Future<List<dynamic>> teamsByEventKey(String eventKey) async{
    var jsonData = [];

    try {
      var response = await http
       .get(Uri.parse("https://www.thebluealliance.com/api/v3/event/$eventKey/teams/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
      
      jsonData = jsonDecode(response.body);
    } catch (err) {
      throw Exception('$err');
    }
    return jsonData;
  }

  static Future<List<String>> yearsParticipated(String team) async {
    List<String> jsonData;

    try {
      var response = await http.get(Uri.parse(
        'https://www.thebluealliance.com/api/v3/team/frc$team/years_participated?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq'
      ));
      jsonData = jsonDecode(response.body) as List<String>;
    } catch (err) {
      throw Exception(err);
    }
    return jsonData;
  }

}


