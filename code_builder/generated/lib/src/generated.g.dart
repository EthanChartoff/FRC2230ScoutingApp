// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated.dart';

// **************************************************************************
// ScoutingFormGenerator
// **************************************************************************

class ScoutingForm extends StatefulWidget {
  final void Function() exit;

  final String matchId;

  final String teamId;

  final String alliance;

  const ScoutingForm({
    required this.exit,
    required this.matchId,
    required this.teamId,
    required this.alliance
  });

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

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          ///TODO: format children to here
          ScoutingCheckbox(
            controller: _didRobotWinController,
            value: _didRobotWinController.value,
            onChanged: (value) => setState(() {
              _didRobotWinController.value = value;
            })
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
            value: _wasRobotOnFieldController.value,
            onChanged: (value) => setState(() {
              _wasRobotOnFieldController.value = value;
            })
          ),
        
          ScoutingCheckbox(
            controller: _didRobotWorkInAutoController,
            value: _didRobotWorkInAutoController.value,
            onChanged: (value) => setState(() {
              _didRobotWorkInAutoController.value = value;
            })
          ),
        
          ScoutingCheckbox(
            controller: _didRobotWorkInTeleOpController,
            value: _didRobotWorkInTeleOpController.value,
            onChanged: (value) => setState(() {
              _didRobotWorkInTeleOpController.value = value;
            })
          ),
        
          ScoutingCheckbox(
            controller: _didRobotDefendController,
            value: _didRobotDefendController.value,
            onChanged: (value) => setState(() {
              _didRobotDefendController.value = value;
            })
          ),
        
          ScoutingCheckbox(
            controller: _wasStrategyDifferentController,
            value: _wasStrategyDifferentController.value,
            onChanged: (value) => setState(() {
              _wasStrategyDifferentController.value = value;
            })
          ),
        
          ScoutingTextFormField(
            controller: _defenseCommentsController,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),
        
          ScoutingTextFormField(
            controller: _robotCommentsController,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),
        
          ScoutingTextFormField(
            controller: _strategyCommentsController,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),
        
          ScoutingTextFormField(
            controller: _scouterNameController,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),
        
          ElevatedButton(
            onPressed: widget.exit,
            child: null
          ),
      
          // ElevatedButton(
          //   onPressed: (() => InsertScoutingDataTable.newTable(
          //     matchId: widget.matchId,
          //     teamId: widget.teamId,
          //     didRobotWin: _didRobotWinController.value,
          //     alliance: widget.alliance,
          //     startingPosition: _startingPositionController.value,
          //     wasRobotOnField: _wasRobotOnFieldController.value,
          //     didRobotWorkInAuto: _didRobotWorkInAutoController.value,
          //     didRobotWorkInTeleOp: _didRobotWorkInTeleOpController.value,
          //     didRobotDefend: _didRobotDefendController.value,
          //     wasStrategyDifferent: _wasStrategyDifferentController.value,
          //     defenseComments: _defenseCommentsController.value,
          //     robotComments: _robotCommentsController.value,
          //     strategyComments: _strategyCommentsController.value,
          //     scouterName: _scouterNameController.value,

          //   )),
          //   child: null
          // )
        ]
      )
    );
  }
}
