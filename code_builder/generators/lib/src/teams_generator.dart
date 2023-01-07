import 'dart:async';

import 'package:build/build.dart';
import 'package:scoute_prime/api/TBA/get_team.dart';


/// Builds a list of [TeamsData]
class TeamsBuilder extends Builder {

  String TeamsDataList(List<dynamic> teams) {
    var buffer = StringBuffer();

    buffer.writeln();
    teams.forEach((element) {
      buffer.writeln('''
  TeamsData(
    number: ${element['team_number']},
    name: '${element['nickname'].replaceAll("'", '').replaceAll("\$", '\$')}',
    color: null,
  ),
''');
    });

    return buffer.toString();
  }

  FutureOr<String> get Teams async {
    var buffer = StringBuffer();
    var teams = await GetTeamsTBA.allSimple();

    if(teams != null) {
      buffer.write('''
List<TeamsData> get allTeams => <TeamsData>[${TeamsDataList(teams)}];
''');
    }

  return buffer.toString();
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var copyId = inputId.changeExtension('.g_teams.dart');

    var contents = await buildStep.readAsString(inputId);

    await buildStep.writeAsString(copyId, Teams);
  }

  @override
  Map<String, List<String>> get buildExtensions => 
    {'.txt': ['.g_teams.dart']}; 
}
