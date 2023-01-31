/// MOST OF THE CODE IS GENERATED, BE CAREFUL WHEN EDITING


import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/matches.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/new_scouting_data_table2023.dart';
import 'package:scoute_prime/misc/enums.dart';
import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/timed_button.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/title.dart';


class ScoutingForm2023 extends StatefulWidget {
  final void Function() exit;

  final String matchId;

  final String teamId;

  final String alliance;

  const ScoutingForm2023({
    required this.exit,
    required this.matchId,
    required this.teamId,
    required this.alliance
    });

  @override
  State<StatefulWidget> createState() => _ScoutingForm2023State();
}

class _ScoutingForm2023State extends State<ScoutingForm2023> {
  final ValueNotifier<String> _winLoseOrTieController =
      ValueNotifier<String>('');

  final ValueNotifier<String> _startingPositionController =
      ValueNotifier<String>('');

  final ValueNotifier<bool> _wasRobotOnFieldController =
      ValueNotifier<bool>(true);

  final ValueNotifier<bool> _didRobotWorkInAutoController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didRobotWorkInTeleOpController =
      ValueNotifier<bool>(false);

  final TextEditingController _defenseCommentsController =
      TextEditingController();

  final TextEditingController _robotCommentsController =
      TextEditingController();

  final TextEditingController _scouterNameController = TextEditingController();

  final ValueNotifier<bool> _didDefendTeleOpController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didGetDefendedTeleOpController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didDefendEndGameController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didGetDefendedEndGameController =
      ValueNotifier<bool>(false);

  final ValueNotifier<String> _startingItemOnRobotController =
      ValueNotifier<String>('');

  final ValueNotifier<int> _rowOneCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowOneCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _rowTwoCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowTwoCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _rowThreeCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowThreeCubesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _rowOneConesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowOneConesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _rowTwoConesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowTwoConesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _rowThreeConesController = ValueNotifier<int>(0);

  final ValueNotifier<int> _tryRowThreeConesController = ValueNotifier<int>(0);

  final ValueNotifier<bool> _didFeedController = ValueNotifier<bool>(false);

  final ValueNotifier<int> _numOfCubesGatheredIntoComunityController =
      ValueNotifier<int>(0);

  final ValueNotifier<int> _numOfConesGatheredIntoComunityController =
      ValueNotifier<int>(0);

  final ValueNotifier<double> _numOfSecondsOnChargeStationController =
      ValueNotifier<double>(0);

  final ValueNotifier<double>
      _numSecondsBeforeEndPivotedToChargeStationController =
      ValueNotifier<double>(0);

  final ValueNotifier<String> _autoChargeStationStatusController =
      ValueNotifier<String>('');

  final ValueNotifier<String> _endGameChargeStationStatusController =
      ValueNotifier<String>('');

  final ValueNotifier<double> _autoNumOfSecondsUntilBalancedController =
      ValueNotifier<double>(0);

  final ValueNotifier<double> _endgameNumOfSecondsUntilBalancedController =
      ValueNotifier<double>(0);

  final ValueNotifier<String> _fromWhereRobotDroveToChargeStationController =
      ValueNotifier<String>('');

  final ValueNotifier<String> _numOfRobotsOnChargeStationAtEndController =
      ValueNotifier<String>('');

  final ValueNotifier<bool> _autoDidRobotComeOutOfComunityController =
      ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _winLoseOrTieController.dispose();
    _startingPositionController.dispose();
    _wasRobotOnFieldController.dispose();
    _didRobotWorkInAutoController.dispose();
    _didRobotWorkInTeleOpController.dispose();
    _defenseCommentsController.dispose();
    _robotCommentsController.dispose();
    _scouterNameController.dispose();
    _didDefendTeleOpController.dispose();
    _didGetDefendedTeleOpController.dispose();
    _didDefendEndGameController.dispose();
    _didGetDefendedEndGameController.dispose();
    _startingItemOnRobotController.dispose();
    _rowOneCubesController.dispose();
    _tryRowOneCubesController.dispose();
    _rowTwoCubesController.dispose();
    _tryRowTwoCubesController.dispose();
    _rowThreeCubesController.dispose();
    _tryRowThreeCubesController.dispose();
    _rowOneConesController.dispose();
    _tryRowOneConesController.dispose();
    _rowTwoConesController.dispose();
    _tryRowTwoConesController.dispose();
    _rowThreeConesController.dispose();
    _tryRowThreeConesController.dispose();
    _didFeedController.dispose();
    _numOfCubesGatheredIntoComunityController.dispose();
    _numOfConesGatheredIntoComunityController.dispose();
    _numOfSecondsOnChargeStationController.dispose();
    _numSecondsBeforeEndPivotedToChargeStationController.dispose();
    _autoChargeStationStatusController.dispose();
    _endGameChargeStationStatusController.dispose();
    _autoNumOfSecondsUntilBalancedController.dispose();
    _endgameNumOfSecondsUntilBalancedController.dispose();
    _fromWhereRobotDroveToChargeStationController.dispose();
    _numOfRobotsOnChargeStationAtEndController.dispose();
    _autoDidRobotComeOutOfComunityController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            /// # Information about the match and basic data points.
            const ScoutingTitle(
              title: 'MATCH INFO'
            ),

            Container(
              width: double.infinity,
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '#${widget.teamId} ${TeamsData.allTeams.
                          firstWhere((element) => element.number.toString() 
                            == widget.teamId).name}',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: widget.alliance == 'R' ?
                           Colors.red : Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ScoutingTextFormField(
              controller: _scouterNameController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'scouterName',
            ),

            ScoutingCheckbox(
              controller: _wasRobotOnFieldController,
              onChanged: (value) => setState(() {
                _wasRobotOnFieldController.value = value!;
              }),
              title: 'was robot on field?', 
            ),

            ScoutingDropdownButtonFormField(
              items: widget.alliance == 'B' ? const [
                DropdownMenuItem(value: '1', child: Text('blue 1')),
                DropdownMenuItem(value: '2', child: Text('blue 2')),
                DropdownMenuItem(value: '3', child: Text('blue 3')),
              ] : const [
                DropdownMenuItem(value: '4', child: Text('red 1')),
                DropdownMenuItem(value: '5', child: Text('red 2')),
                DropdownMenuItem(value: '6', child: Text('red 3')),
              ],
              controller: _startingPositionController,
              hint: 'starting position',
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'b', child: Text('cube')),
                DropdownMenuItem(value: 'c', child: Text('cone')),
                DropdownMenuItem(value: 'n', child: Text('none')),
              ],
              controller: _startingItemOnRobotController,
              hint: 'starting item on robot',
            ),

            /// # Data points specific for the autonomous period.
            const ScoutingTitle(
              title: 'AUTO'
            ),

            ScoutingCheckbox(
              controller: _didRobotWorkInAutoController,
              onChanged: (value) => setState(() {
                _didRobotWorkInAutoController.value = value!;
              }), 
              title: 'did robot work in auto?',
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'd', child: Text('docked')),
                DropdownMenuItem(value: 'e', child: Text('engaged')),
                DropdownMenuItem(value: 'p', child: Text('parked')),
                DropdownMenuItem(value: 'n', child: Text('none')),
              ],
              controller: _autoChargeStationStatusController,
              hint: 'auto charge station status',
            ),

            ScoutingCheckbox(
              controller: _autoDidRobotComeOutOfComunityController,
              onChanged: (value) => setState(() {
                _autoDidRobotComeOutOfComunityController.value = value!;
              }), 
              title: 'did robot come out of comunity in auto?',
            ),

            /// # Data points specific for the teleoperated period.
            const ScoutingTitle(
              title: 'TELEOP'
            ),

            ScoutingCheckbox(
              controller: _didRobotWorkInTeleOpController,
              onChanged: (value) => setState(() {
                _didRobotWorkInTeleOpController.value = value!;
              }), 
              title: 'did robot work in teleop?',
            ),

            ScoutingCheckbox(
              controller: _didDefendTeleOpController,
              onChanged: (value) => setState(() {
                _didDefendTeleOpController.value = value!;
              }), 
              title: 'did robot defend in teleop?',
            ),
            
            ScoutingCheckbox(
              controller: _didGetDefendedTeleOpController,
              onChanged: (value) => setState(() {
                _didGetDefendedTeleOpController.value = value!;
              }), 
              title: 'did robot get defended in teleop?',
            ),

            ScoutingCheckbox(
              controller: _didFeedController,
              onChanged: (value) => setState(() {
                _didFeedController.value = value!;
              }), 
              title: 'did robot feed?',
            ),

            /// ## game items scored.
            
            Container(
              width: double.infinity,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5
                ),
                children: [
                  ScoutingShotCounter(
                    controller: _rowOneCubesController,
                    title: 'scored cubes in row 1',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowOneCubesController,
                    title: 'tried to score cubes in row 1',
                  ),
                
                  ScoutingShotCounter(
                    controller: _rowTwoCubesController,
                    title: 'scored cubes in row 2',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowTwoCubesController,
                    title: 'tried to score cubes in row 2',
                  ),
                
                  ScoutingShotCounter(
                    controller: _rowThreeCubesController,
                    title: 'scored cubes in row 3',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowThreeCubesController,
                    title: 'tried to score cubes in row 3',
                  ),
                
                  ScoutingShotCounter(
                    controller: _rowOneConesController,
                    title: 'scored cones in row 1',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowOneConesController,
                    title: 'tried to score cones in row 1',
                  ),
                
                  ScoutingShotCounter(
                    controller: _rowTwoConesController,
                    title: 'scored cones in row 2',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowTwoConesController,
                    title: 'tried to score cones in row 2',
                  ),
                
                  ScoutingShotCounter(
                    controller: _rowThreeConesController,
                    title: 'scored cones in row 3',
                  ),
                
                  ScoutingShotCounter(
                    controller: _tryRowThreeConesController,
                    title: 'tried to score cones in row 3',
                  ),
                ],
              ),
            ),

            ScoutingShotCounter(
              controller: _numOfCubesGatheredIntoComunityController,
              title: 'number of cubes gathered into comunity',
            ),
          
            ScoutingShotCounter(
              controller: _numOfConesGatheredIntoComunityController,
              title: 'number of cones gathered into comunity',
            ),

            /// # Data points specific for the endgame period.
            const ScoutingTitle(
              title: 'ENDGAME'
            ),

            ScoutingCheckbox(
              controller: _didDefendEndGameController,
              onChanged: (value) => setState(() {
                _didDefendEndGameController.value = value!;
              }), 
              title: 'did robot defend in endgame?',
            ),
            
            ScoutingCheckbox(
              controller: _didGetDefendedEndGameController,
              onChanged: (value) => setState(() {
                _didGetDefendedEndGameController.value = value!;
              }), 
              title: 'did robot get defended in endgame?',
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'd', child: Text('docked')),
                DropdownMenuItem(value: 'e', child: Text('engaged')),
                DropdownMenuItem(value: 'p', child: Text('parked')),
                DropdownMenuItem(value: 'n', child: Text('none')),
              ],
              controller: _endGameChargeStationStatusController,
              hint: 'end game charge station status',
            ),

            /// # Data for when the match is done.
            const ScoutingTitle(
              title: 'COMMENTS'
            ),

            ScoutingTextFormField(
              controller: _defenseCommentsController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'defenseComments',
            ),
          
            ScoutingTextFormField(
              controller: _robotCommentsController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'robotComments',
            ),
            
            ScoutingDropdownButtonFormField(
              controller: _winLoseOrTieController,
              items: const [
                DropdownMenuItem(value: 'w', child: Text('win')),
                DropdownMenuItem(value: 'l', child: Text('lose')),
                DropdownMenuItem(value: 't', child: Text('tie')),
              ],
              hint: 'did robot win, lose or tie?',
            ),

            ScoutingButtonTimer(
              controller: _autoNumOfSecondsUntilBalancedController,
            ),
          
            ScoutingButtonTimer(
              controller: _endgameNumOfSecondsUntilBalancedController,
            ),
          
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'c', child: Text('comunity')),
                DropdownMenuItem(value: 'o', child: Text('out')),
              ],
              controller: _fromWhereRobotDroveToChargeStationController,
              hint: 'from where robot drove to charge station',
            ),
          
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '0', child: Text('0')),
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(value: '3', child: Text('3')),
              ],
              controller: _numOfRobotsOnChargeStationAtEndController,
              hint: 'number of robots on charge station at end',
            ),
          
            ElevatedButton(
              onPressed: widget.exit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              child: const Text(
                'EXIT',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
        
            ElevatedButton(
              onPressed: () async {
                InsertScoutingDataTable2023.newTable(
                  matchId: widget.matchId,
                  teamId: widget.teamId,
                  alliance: widget.alliance,
                  winLoseOrTie: _winLoseOrTieController.value,
                  startingPosition: _startingPositionController.value,
                  wasRobotOnField: _wasRobotOnFieldController.value ? '1' : '0',
                  didRobotWorkInAuto: _didRobotWorkInAutoController.value ? '1' : '0',
                  didRobotWorkInTeleOp: _didRobotWorkInTeleOpController.value ? '1' : '0',
                  defenseComments: _defenseCommentsController.text,
                  robotComments: _robotCommentsController.text,
                  scouterName: _scouterNameController.text,
                  didDefendTeleOp: _didDefendTeleOpController.value ? '1' : '0',
                  didGetDefendedTeleOp: _didGetDefendedTeleOpController.value ? '1' : '0',
                  didDefendEndGame: _didDefendEndGameController.value ? '1' : '0',
                  didGetDefendedEndGame: _didGetDefendedEndGameController.value ? '1' : '0',
                  startingItemOnRobot: _startingItemOnRobotController.value,
                  rowOneCubes: _rowOneCubesController.value,
                  tryRowOneCubes: _tryRowOneCubesController.value,
                  rowTwoCubes: _rowTwoCubesController.value,
                  tryRowTwoCubes: _tryRowTwoCubesController.value,
                  rowThreeCubes: _rowThreeCubesController.value,
                  tryRowThreeCubes: _tryRowThreeCubesController.value,
                  rowOneCones: _rowOneConesController.value,
                  tryRowOneCones: _tryRowOneConesController.value,
                  rowTwoCones: _rowTwoConesController.value,
                  tryRowTwoCones: _tryRowTwoConesController.value,
                  rowThreeCones: _rowThreeConesController.value,
                  tryRowThreeCones: _tryRowThreeConesController.value,
                  didFeed: _didFeedController.value ? '1' : '0',
                  numOfCubesGatheredIntoComunity: _numOfCubesGatheredIntoComunityController.value,
                  numOfConesGatheredIntoComunity: _numOfConesGatheredIntoComunityController.value,
                  numOfSecondsOnChargeStation: _numOfSecondsOnChargeStationController.value,
                  numSecondsBeforeEndPivotedToChargeStation: _numSecondsBeforeEndPivotedToChargeStationController.value,
                  autoChargeStationStatus: _autoChargeStationStatusController.value,
                  endGameChargeStationStatus: _endGameChargeStationStatusController.value,
                  autoNumOfSecondsUntilBalanced: _autoNumOfSecondsUntilBalancedController.value,
                  endgameNumOfSecondsUntilBalanced: _endgameNumOfSecondsUntilBalancedController.value,
                  fromWhereRobotDroveToChargeStation: _fromWhereRobotDroveToChargeStationController.value,
                  numOfRobotsOnChargeStationAtEnd: _numOfRobotsOnChargeStationAtEndController.value,
                  autoDidRobotComeOutOfComunity: _autoDidRobotComeOutOfComunityController.value ? '1' : '0',
                );

                final scoutingTablesOfMatch = await GetScoutingData
                  .fromMatchId(widget.matchId);
                var uniqueTeamsOfTables = [];
                for (var match in scoutingTablesOfMatch) {
                  /// if value has 6 items that have a unique team id, 
                  /// change the match status to complete.
                  if(!uniqueTeamsOfTables.contains(match['teamId'])) {
                    uniqueTeamsOfTables.add(match['teamId']);
                  }
                }
                if(uniqueTeamsOfTables.length == 6) {
                  /// get the most common wonLoseOrTie value for each 
                  /// alliance, if red won most of the time and blue lost 
                  /// most of the time, then the match status is red (R),
                  /// and vice versa. if most time was tied, then the 
                  /// match status is tied (T).
                  var redWonLoseOrTie = [];
                  var blueWonLoseOrTie = [];
                  for (var match in scoutingTablesOfMatch) {
                    if(match['alliance'] == 'R') {
                      redWonLoseOrTie.add(match['winLoseOrTie']);
                    } else if(match['alliance'] == 'B') {
                      blueWonLoseOrTie.add(match['winLoseOrTie']);
                    }
                  }

                  final String redMostCommonWonLoseOrTie = redWonLoseOrTie
                    .reduce((a, b) => redWonLoseOrTie
                      .where((x) => x == a)
                      .length > redWonLoseOrTie
                      .where((x) => x == b)
                      .length ? a : b
                    );
                  final String blueMostCommonWonLoseOrTie = blueWonLoseOrTie
                    .reduce((a, b) => blueWonLoseOrTie
                      .where((x) => x == a)
                      .length > blueWonLoseOrTie
                      .where((x) => x == b)
                      .length ? a : b
                    );
                    
                  if(blueMostCommonWonLoseOrTie == 'l' 
                    && redMostCommonWonLoseOrTie == 'w') {
                    InsertMatchesDataTable2023.updateMatchStatus(
                      widget.matchId,
                      'B'
                    );
                  } else if(blueMostCommonWonLoseOrTie == 'w' 
                    && redMostCommonWonLoseOrTie == 'l') {
                    InsertMatchesDataTable2023.updateMatchStatus(
                      widget.matchId,
                      'R'
                    );
                  } else if(blueMostCommonWonLoseOrTie == 't' 
                    && redMostCommonWonLoseOrTie == 't') {
                    InsertMatchesDataTable2023.updateMatchStatus(
                      widget.matchId,
                      'T'
                    );
                  } 
                }
                  
                widget.exit();
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              child: const Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            )
          ]
        )
      ),
    );
  }
}
