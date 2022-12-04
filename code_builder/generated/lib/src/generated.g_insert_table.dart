import 'package:http/http.dart' as http;

class InsertScoutingDataTable {
  static void newTable({
    required shotCounter,
    required shotCounter1,
    required shotCounter2,
    required dropdownButton,
    required textfield,
    required checkbox,
    required buttonTimer,
    required checkbox1,
  }) async {
    try {
      final response = await http.post(
          Uri.parse(
              'http://localhost/2230_scouting/new_scouting_data_table.php'),
          body: {
            'id': '',
            'shotCounter': '$shotCounter',
            'shotCounter1': '$shotCounter1',
            'shotCounter2': '$shotCounter2',
            'dropdownButton': '$dropdownButton',
            'textfield': '$textfield',
            'checkbox': '$checkbox',
            'buttonTimer': '$buttonTimer',
            'checkbox1': '$checkbox1',
            'createdAt': ''
          });
    } catch (err) {
      // print('$err lol');
      throw Exception('$err');
    }
  }
}
