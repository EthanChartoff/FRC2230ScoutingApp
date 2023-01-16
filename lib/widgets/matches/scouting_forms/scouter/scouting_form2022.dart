import 'package:flutter/material.dart';

import 'package:scoute_prime/api/2230_database/dart/insert/new_scouting_data_table2022.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/items/timed_button.dart';

// **************************************************************************
// ScoutingFormGenerator
// **************************************************************************

class ScoutingForm2022 extends StatefulWidget {
  final void Function() exit;

  final String matchId;

  final String teamId;

  final String alliance;

  const ScoutingForm2022(
      {required this.exit,
      required this.matchId,
      required this.teamId,
      required this.alliance});

  @override
  State<StatefulWidget> createState() => _ScoutingForm2022State();
}

// **************************************************************************
// ScoutingFormStateGenerator
// **************************************************************************

class _ScoutingForm2022State extends State<ScoutingForm2022> {
  final ValueNotifier<bool> _didRobotWinController = ValueNotifier<bool>(false);

  final ValueNotifier<String> _startingPositionController =
      ValueNotifier<String>('');

  final ValueNotifier<bool> _wasRobotOnFieldController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didRobotWorkInAutoController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didRobotWorkInTeleOpController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _didRobotDefendController =
      ValueNotifier<bool>(false);

  final ValueNotifier<bool> _wasStrategyDifferentController =
      ValueNotifier<bool>(false);

  final TextEditingController _defenseCommentsController =
      TextEditingController();

  final TextEditingController _robotCommentsController =
      TextEditingController();

  final TextEditingController _strategyCommentsController =
      TextEditingController();

  final TextEditingController _scouterNameController = TextEditingController();

  final ValueNotifier<int> _autoUpShotController = ValueNotifier<int>(0);

  final ValueNotifier<int> _autoUpScoredController = ValueNotifier<int>(0);

  final ValueNotifier<int> _autoLowShotController = ValueNotifier<int>(0);

  final ValueNotifier<int> _autoLowScoredController = ValueNotifier<int>(0);

  final ValueNotifier<int> _TeleopUpShotController = ValueNotifier<int>(0);

  final ValueNotifier<int> _TeleopUpScoredController = ValueNotifier<int>(0);

  final ValueNotifier<int> _TeleopLowShotController = ValueNotifier<int>(0);

  final ValueNotifier<int> _TeleopLowScoredController = ValueNotifier<int>(0);

  final ValueNotifier<String> _triedToClimbLevelController =
      ValueNotifier<String>('');

  final ValueNotifier<String> _ClimbLevelController = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _didRobotWinController.dispose();
    _startingPositionController.dispose();
    _wasRobotOnFieldController.dispose();
    _didRobotWorkInAutoController.dispose();
    _didRobotWorkInTeleOpController.dispose();
    _didRobotDefendController.dispose();
    _wasStrategyDifferentController.dispose();
    _defenseCommentsController.dispose();
    _robotCommentsController.dispose();
    _strategyCommentsController.dispose();
    _scouterNameController.dispose();
    _autoUpShotController.dispose();
    _autoUpScoredController.dispose();
    _autoLowShotController.dispose();
    _autoLowScoredController.dispose();
    _TeleopUpShotController.dispose();
    _TeleopUpScoredController.dispose();
    _TeleopLowShotController.dispose();
    _TeleopLowScoredController.dispose();
    _triedToClimbLevelController.dispose();
    _ClimbLevelController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            ScoutingCheckbox(
              controller: _didRobotWinController,
              onChanged: (value) => setState(() {
                _didRobotWinController.value = value!;
              }), 
              title: 'did robot win?',
            ),
            
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '1', child: Text('blue 1')),
                DropdownMenuItem(value: '2', child: Text('blue 2')),
                DropdownMenuItem(value: '3', child: Text('blue 3')),
                DropdownMenuItem(value: '4', child: Text('red 1')),
                DropdownMenuItem(value: '5', child: Text('red 2')),
                DropdownMenuItem(value: '6', child: Text('red 3')),
              ],
              controller: _startingPositionController,
            ),
          
            ScoutingCheckbox(
              controller: _wasRobotOnFieldController,
              onChanged: (value) => setState(() {
                _wasRobotOnFieldController.value = value!;
              }), 
            ),
          
            ScoutingCheckbox(
              controller: _didRobotWorkInAutoController,
              onChanged: (value) => setState(() {
                _didRobotWorkInAutoController.value = value!;
              }), 
            ),
          
            ScoutingCheckbox(
              controller: _didRobotWorkInTeleOpController,
              onChanged: (value) => setState(() {
                _didRobotWorkInTeleOpController.value = value!;
              }), 
            ),
          
            ScoutingCheckbox(
              controller: _didRobotDefendController,
              onChanged: (value) => setState(() {
                _didRobotDefendController.value = value!;
              }), 
            ),
          
            ScoutingCheckbox(
              controller: _wasStrategyDifferentController,
              onChanged: (value) => setState(() {
                _wasStrategyDifferentController.value = value!;
              }), 
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
          
            ScoutingTextFormField(
              controller: _strategyCommentsController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'strategyComments',
            ),
          
            ScoutingTextFormField(
              controller: _scouterNameController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'scouterName',
            ),
          
            ScoutingShotCounter(
              controller: _autoUpShotController,
            ),
          
            ScoutingShotCounter(
              controller: _autoUpScoredController,
            ),
          
            ScoutingShotCounter(
              controller: _autoLowShotController,
            ),
          
            ScoutingShotCounter(
              controller: _autoLowScoredController,
            ),
          
            ScoutingShotCounter(
              controller: _TeleopUpShotController,
            ),
          
            ScoutingShotCounter(
              controller: _TeleopUpScoredController,
            ),
          
            ScoutingShotCounter(
              controller: _TeleopLowShotController,
            ),
          
            ScoutingShotCounter(
              controller: _TeleopLowScoredController,
            ),
          
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(value: '3', child: Text('3')),
                DropdownMenuItem(value: '4', child: Text('4')),
              ],
              controller: _triedToClimbLevelController,
            ),
          
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(value: '3', child: Text('3')),
                DropdownMenuItem(value: '4', child: Text('4')),
              ],
              controller: _ClimbLevelController,
            ),
          
            ElevatedButton(
              onPressed: widget.exit,
              child: null
            ),
        
            ElevatedButton(
              onPressed: (() => InsertScoutingDataTable2022.newTable(
                matchId: widget.matchId,
                teamId: widget.teamId,
                didRobotWin: _didRobotWinController.value ? '1' : '0',
                alliance: widget.alliance,
                startingPosition: _startingPositionController.value,
                wasRobotOnField: _wasRobotOnFieldController.value ? '1' : '0',
                didRobotWorkInAuto: _didRobotWorkInAutoController.value ? '1' : '0',
                didRobotWorkInTeleOp: _didRobotWorkInTeleOpController.value ? '1' : '0',
                didRobotDefend: _didRobotDefendController.value ? '1' : '0',
                wasStrategyDifferent: _wasStrategyDifferentController.value ? '1' : '0',
                defenseComments: _defenseCommentsController.text,
                robotComments: _robotCommentsController.text,
                strategyComments: _strategyCommentsController.text,
                scouterName: _scouterNameController.text,
                autoUpShot: _autoUpShotController.value,
                autoUpScored: _autoUpScoredController.value,
                autoLowShot: _autoLowShotController.value,
                autoLowScored: _autoLowScoredController.value,
                TeleopUpShot: _TeleopUpShotController.value,
                TeleopUpScored: _TeleopUpScoredController.value,
                TeleopLowShot: _TeleopLowShotController.value,
                TeleopLowScored: _TeleopLowScoredController.value,
                triedToClimbLevel: _triedToClimbLevelController.value,
                ClimbLevel: _ClimbLevelController.value,
    
              )),
              child: null
            )
      
          ]
        )
      ),
    );
  }
}
