import 'package:http/http.dart' as http;
import 'package:scoute_prime/misc/constants.dart';


class InsertMatchesDataTable2023 {
  static void updateMatchStatus(String matchId, String matchStatus) async {
    try {
      /// updates match status
      final response = await http.post(
        Uri.parse(
          '$websiteUrl/php/update_match_status.php'),
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