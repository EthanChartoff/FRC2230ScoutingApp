import 'package:http/http.dart' as http;


class InsertMatchesDataTable2023 {
  static void updateMatchStatus(String matchId, String matchStatus) async {
    try {
      /// updates match status
      final response = await http.post(
        Uri.parse(
          'http://192.168.1.47/2230_scouting/update_match_status.php'),
        body: {
          'matchId': matchId,
          'matchStatus': matchStatus,
        }
      );
    } catch (err) {
      throw Exception('$err');
    }
  }
}