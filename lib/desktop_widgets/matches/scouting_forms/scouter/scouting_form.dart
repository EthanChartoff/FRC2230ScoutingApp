import 'package:flutter/material.dart';

import 'package:scoute_prime/api/dart/insert/new_scouting_data_table.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/timed_button.dart';

// **************************************************************************
// ScoutingFormGenerator
// **************************************************************************

class ScoutingForm extends StatefulWidget {
  final void Function() exit;

  final String matchId;

  final String teamId;

  final String alliance;

  const ScoutingForm(
      {required this.exit,
      required this.matchId,
      required this.teamId,
      required this.alliance});

  @override
  State<StatefulWidget> createState() => _ScoutingFormState();
}

// **************************************************************************
// ScoutingFormStateGenerator
// **************************************************************************

class _ScoutingFormState extends State<ScoutingForm> {
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

  final ValueNotifier<int> _shotCounter1Controller = ValueNotifier<int>(0);

  final ValueNotifier<int> _shotCounter2Controller = ValueNotifier<int>(0);

  final ValueNotifier<String> _dropdownButtonController =
      ValueNotifier<String>('');

  final TextEditingController _textfieldController = TextEditingController();

  final ValueNotifier<bool> _checkboxController = ValueNotifier<bool>(false);

  final ValueNotifier<double> _buttonTimerController = ValueNotifier<double>(0);

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
    _shotCounter1Controller.dispose();
    _shotCounter2Controller.dispose();
    _dropdownButtonController.dispose();
    _textfieldController.dispose();
    _checkboxController.dispose();
    _buttonTimerController.dispose();

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
              title: 'did robot win?'
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
              controller: _shotCounter1Controller,
            ),
          
            ScoutingShotCounter(
              controller: _shotCounter2Controller,
            ),
          
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '1', child: Text('comp 1')),
                DropdownMenuItem(value: '2', child: Text('comp 2')),
                DropdownMenuItem(value: '3', child: Text('comp 3')),
                DropdownMenuItem(value: '4', child: Text('comp 4')),
                DropdownMenuItem(value: '5', child: Text('comp 5')),
              ],
              controller: _dropdownButtonController,
            ),
          
            ScoutingTextFormField(
              controller: _textfieldController,
              onChanged: (value) => setState(() {}),
              hint: 'input something',
              labelText: 'textfield',
            ),
          
            ScoutingCheckbox(
              controller: _checkboxController,
              onChanged: (value) => setState(() {
                _checkboxController.value = value!;
              }), 
            ),
          
            ScoutingButtonTimer(
              controller: _buttonTimerController,
            ),
          
            ElevatedButton(
              onPressed: widget.exit,
              child: null
            ),
        
            ElevatedButton(
              onPressed: (() => InsertScoutingDataTable.newTable(
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
                shotCounter1: _shotCounter1Controller.value,
                shotCounter2: _shotCounter2Controller.value,
                dropdownButton: _dropdownButtonController.value,
                textfield: _textfieldController.text,
                checkbox: _checkboxController.value ? '1' : '0',
                buttonTimer: _buttonTimerController.value,
              )),
              child: null
            )
          ]
        )
      ),
    );
  }
}
