import 'package:http/http.dart' as http;
import 'dart:convert';

/// TODO: class my need to be abstract, change name to a more sutible one
/// and add more filter getters
class GetEventsTBA {

  /// Get all events from TBA by year.
  /// 
  /// The first first event was in 1992, so any year below that will return 
  /// an empty json 
  static Future<List<dynamic>> allSimple() async {
    var jsonData = [];
    int year = 1992;

    try {
      while(true) {
        var response = await http
         .get(Uri.parse("https://www.thebluealliance. com/api/v3/events/$year/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        
        if(!response.body.toString().contains('0')) {
          break;
        }
        year++;
        jsonData += jsonDecode(response.body);
      }
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
    return jsonData;
  }

  /// gets all events of years in the list 
  static Future<List<dynamic>> eventsInYears(List<String> years) async {
    var jsonData = [];

    try {
      for (var element in years) {
        var response = await http
         .get(Uri.parse("https://www.thebluealliance.com/api/v3/events/$element/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        
        List body = jsonDecode(response.body);
        for (var element in body) { 
          jsonData.add(element);
        }} 
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
    return jsonData;
  }

  static Future<List<dynamic>> eventsNameInYears(List<String> years) async {
    var jsonData = [];

    try {
      for (var element in years) {
        var response = await http
         .get(Uri.parse("https://www.thebluealliance.com/api/v3/events/$element/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        
        List body = jsonDecode(response.body);
        for (var element in body) { 
          jsonData.add('${element['name']} - ${element['key']}');
        }} 
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
    return jsonData;
  }

  /// TODO: this can be better...getting all these events is slow.
  static Future<List<String>> allYears() async {
    var jsonData = <String>[];
    int year = 1992;

    try {
      while(true) {
        var response = await http
         .get(Uri.parse("https://www.thebluealliance.com/api/v3/events/$year/simple?X-TBA-Auth-Key=kx16kzCU5g2xiADIEZfE06l8dZJ7aC2EbslUz7i9gmZfWArTiGb8RhbD0jwvHQkq"));
        
        if(!response.body.toString().contains('0')) {
          break;
        }
        jsonData.add(year.toString());
        year++;
      }
    } catch (err) {
      // print('$err lol');
      throw Exception("$err");
    }
    return jsonData;
  }

}


