// // GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated.dart';

// // **************************************************************************
// // ScoutingFormGenerator
// // **************************************************************************

// class ScoutingForm extends StatefulWidget {
//   final void Function() exit;

//   final String matchId;

//   final String teamId;

//   final String alliance;

//   const ScoutingForm(
//       {required this.exit,
//       required this.matchId,
//       required this.teamId,
//       required this.alliance});

//   @override
//   State<StatefulWidget> createState() => _ScoutingFormState();
// }

// // **************************************************************************
// // ScoutingFormStateGenerator
// // **************************************************************************

// class _ScoutingFormState extends State<ScoutingForm> {
//   final ValueNotifier<bool> _winLoseOrTieController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<String> _startingPositionController =
//       ValueNotifier<String>('');

//   final ValueNotifier<bool> _wasRobotOnFieldController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<bool> _didRobotWorkInAutoController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<bool> _didRobotWorkInTeleOpController =
//       ValueNotifier<bool>(false);

//   final TextEditingController _defenseCommentsController =
//       TextEditingController();

//   final TextEditingController _robotCommentsController =
//       TextEditingController();

//   final TextEditingController _scouterNameController = TextEditingController();

//   final ValueNotifier<bool> _didDefendTeleOpController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<bool> _didGetDefendedTeleOpController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<bool> _didDefendEndGameController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<bool> _didGetDefendedEndGameController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<String> _startingItemOnRobotController =
//       ValueNotifier<String>('');

//   final ValueNotifier<int> _rowOneCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowOneCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _rowTwoCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowTwoCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _rowThreeCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowThreeCubesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _rowOneConesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowOneConesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _rowTwoConesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowTwoConesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _rowThreeConesController = ValueNotifier<int>(0);

//   final ValueNotifier<int> _tryRowThreeConesController = ValueNotifier<int>(0);

//   final ValueNotifier<bool> _didFeedController = ValueNotifier<bool>(false);

//   final ValueNotifier<int> _numOfCubesGatheredIntoComunityController =
//       ValueNotifier<int>(0);

//   final ValueNotifier<int> _numOfConesGatheredIntoComunityController =
//       ValueNotifier<int>(0);

//   final ValueNotifier<double> _numOfSecondsOnChargeStationController =
//       ValueNotifier<double>(0);

//   final ValueNotifier<double>
//       _numSecondsBeforeEndPivotedToChargeStationController =
//       ValueNotifier<double>(0);

//   final ValueNotifier<bool> _didGoOnChargeStationController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<String> _autoChargeStationStatusController =
//       ValueNotifier<String>('');

//   final ValueNotifier<String> _endGameChargeStationStatusController =
//       ValueNotifier<String>('');

//   final ValueNotifier<bool> _teleopWasRobotParkedController =
//       ValueNotifier<bool>(false);

//   final ValueNotifier<double> _autoNumOfSecondsUntilBalancedController =
//       ValueNotifier<double>(0);

//   final ValueNotifier<double> _endgameNumOfSecondsUntilBalancedController =
//       ValueNotifier<double>(0);

//   final ValueNotifier<String> _fromWhereRobotDroveToChargeStationController =
//       ValueNotifier<String>('');

//   final ValueNotifier<String> _numOfRobotsOnChargeStationAtEndController =
//       ValueNotifier<String>('');

//   final ValueNotifier<bool> _autoDidRobotComeOutOfComunityController =
//       ValueNotifier<bool>(false);

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     /*
// TODO: delete /**/
//     _winLoseOrTieController.dispose();
//     _startingPositionController.dispose();
//     _wasRobotOnFieldController.dispose();
//     _didRobotWorkInAutoController.dispose();
//     _didRobotWorkInTeleOpController.dispose();
//     _defenseCommentsController.dispose();
//     _robotCommentsController.dispose();
//     _scouterNameController.dispose();
//     _didDefendTeleOpController.dispose();
//     _didGetDefendedTeleOpController.dispose();
//     _didDefendEndGameController.dispose();
//     _didGetDefendedEndGameController.dispose();
//     _startingItemOnRobotController.dispose();
//     _rowOneCubesController.dispose();
//     _tryRowOneCubesController.dispose();
//     _rowTwoCubesController.dispose();
//     _tryRowTwoCubesController.dispose();
//     _rowThreeCubesController.dispose();
//     _tryRowThreeCubesController.dispose();
//     _rowOneConesController.dispose();
//     _tryRowOneConesController.dispose();
//     _rowTwoConesController.dispose();
//     _tryRowTwoConesController.dispose();
//     _rowThreeConesController.dispose();
//     _tryRowThreeConesController.dispose();
//     _didFeedController.dispose();
//     _numOfCubesGatheredIntoComunityController.dispose();
//     _numOfConesGatheredIntoComunityController.dispose();
//     _numOfSecondsOnChargeStationController.dispose();
//     _numSecondsBeforeEndPivotedToChargeStationController.dispose();
//     _didGoOnChargeStationController.dispose();
//     _autoChargeStationStatusController.dispose();
//     _endGameChargeStationStatusController.dispose();
//     _teleopWasRobotParkedController.dispose();
//     _autoNumOfSecondsUntilBalancedController.dispose();
//     _endgameNumOfSecondsUntilBalancedController.dispose();
//     _fromWhereRobotDroveToChargeStationController.dispose();
//     _numOfRobotsOnChargeStationAtEndController.dispose();
//     _autoDidRobotComeOutOfComunityController.dispose();

//     super.dispose();
// */
//   }
//   @override
//   Widget build(BuildContext context) {
//     /*
//     return Material(
//       color: Theme.of(context).backgroundColor,
//       child: Column(
//         children: [
//           ///TODO: format children to here
//       ScoutingCheckbox(
//         controller: _winLoseOrTieController,
//         onChanged: (value) => setState(() {
//           _winLoseOrTieController.value = value!;
//         }), 
//         title: 'did robot win, lose or tie?',
//       ),
      
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: '1', child: Text('blue 1')),
//           //DropdownMenuItem(value: '2', child: Text('blue 2')),
//           //DropdownMenuItem(value: '3', child: Text('blue 3')),
//           //DropdownMenuItem(value: '4', child: Text('red 1')),
//           //DropdownMenuItem(value: '5', child: Text('red 2')),
//           //DropdownMenuItem(value: '6', child: Text('red 3')),
//         ],
//         controller: _startingPositionController,
//       ),
    
//       ScoutingCheckbox(
//         controller: _wasRobotOnFieldController,
//         onChanged: (value) => setState(() {
//           _wasRobotOnFieldController.value = value!;
//         }), 
//       ),
    
//       ScoutingCheckbox(
//         controller: _didRobotWorkInAutoController,
//         onChanged: (value) => setState(() {
//           _didRobotWorkInAutoController.value = value!;
//         }), 
//       ),
    
//       ScoutingCheckbox(
//         controller: _didRobotWorkInTeleOpController,
//         onChanged: (value) => setState(() {
//           _didRobotWorkInTeleOpController.value = value!;
//         }), 
//       ),
    
//       ScoutingTextFormField(
//         controller: _defenseCommentsController,
//         onChanged: (value) => setState(() {}),
//         hint: 'input something',
//         labelText: 'defenseComments',
//       ),
    
//       ScoutingTextFormField(
//         controller: _robotCommentsController,
//         onChanged: (value) => setState(() {}),
//         hint: 'input something',
//         labelText: 'robotComments',
//       ),
    
//       ScoutingTextFormField(
//         controller: _scouterNameController,
//         onChanged: (value) => setState(() {}),
//         hint: 'input something',
//         labelText: 'scouterName',
//       ),
    
//       ScoutingCheckbox(
//         controller: _didDefendTeleOpController,
//         onChanged: (value) => setState(() {
//           _didDefendTeleOpController.value = value!;
//         }), 
//         title: 'did robot defend in teleop?',
//       ),
      
//       ScoutingCheckbox(
//         controller: _didGetDefendedTeleOpController,
//         onChanged: (value) => setState(() {
//           _didGetDefendedTeleOpController.value = value!;
//         }), 
//         title: 'did robot get defended in teleop?',
//       ),
      
//       ScoutingCheckbox(
//         controller: _didDefendEndGameController,
//         onChanged: (value) => setState(() {
//           _didDefendEndGameController.value = value!;
//         }), 
//         title: 'did robot defend in endgame?',
//       ),
      
//       ScoutingCheckbox(
//         controller: _didGetDefendedEndGameController,
//         onChanged: (value) => setState(() {
//           _didGetDefendedEndGameController.value = value!;
//         }), 
//         title: 'did robot get defended in endgame?',
//       ),
      
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: 'b', child: Text('cube')),
//           //DropdownMenuItem(value: 'c', child: Text('cone')),
//           //DropdownMenuItem(value: 'n', child: Text('none')),
//         ],
//         controller: _startingItemOnRobotController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowOneCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowOneCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowTwoCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowTwoCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowThreeCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowThreeCubesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowOneConesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowOneConesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowTwoConesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowTwoConesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _rowThreeConesController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _tryRowThreeConesController,
//       ),
    
//       ScoutingCheckbox(
//         controller: _didFeedController,
//         onChanged: (value) => setState(() {
//           _didFeedController.value = value!;
//         }), 
//         title: 'did robot feed?',
//       ),
      
//       ScoutingShotCounter(
//         controller: _numOfCubesGatheredIntoComunityController,
//       ),
    
//       ScoutingShotCounter(
//         controller: _numOfConesGatheredIntoComunityController,
//       ),
    
//       ScoutingButtonTimer(
//         controller: _numOfSecondsOnChargeStationController,
//       ),
    
//       ScoutingButtonTimer(
//         controller: _numSecondsBeforeEndPivotedToChargeStationController,
//       ),
    
//       ScoutingCheckbox(
//         controller: _didGoOnChargeStationController,
//         onChanged: (value) => setState(() {
//           _didGoOnChargeStationController.value = value!;
//         }), 
//       ),
    
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: 'd', child: Text('docked')),
//           //DropdownMenuItem(value: 'p', child: Text('parked')),
//           //DropdownMenuItem(value: 'n', child: Text('none')),
//         ],
//         controller: _autoChargeStationStatusController,
//       ),
    
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: 'd', child: Text('docked')),
//           //DropdownMenuItem(value: 'p', child: Text('parked')),
//           //DropdownMenuItem(value: 'n', child: Text('none')),
//         ],
//         controller: _endGameChargeStationStatusController,
//       ),
    
//       ScoutingCheckbox(
//         controller: _teleopWasRobotParkedController,
//         onChanged: (value) => setState(() {
//           _teleopWasRobotParkedController.value = value!;
//         }), 
//         title: 'was robot parked in teleop?',
//       ),
      
//       ScoutingButtonTimer(
//         controller: _autoNumOfSecondsUntilBalancedController,
//       ),
    
//       ScoutingButtonTimer(
//         controller: _endgameNumOfSecondsUntilBalancedController,
//       ),
    
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: 'c', child: Text('comunity')),
//           //DropdownMenuItem(value: 'o', child: Text('out')),
//         ],
//         controller: _fromWhereRobotDroveToChargeStationController,
//       ),
    
//       ScoutingDropdownButtonFormField(
//         items: const [
//           //DropdownMenuItem(value: '0', child: Text('0')),
//           //DropdownMenuItem(value: '1', child: Text('1')),
//           //DropdownMenuItem(value: '2', child: Text('2')),
//           //DropdownMenuItem(value: '3', child: Text('3')),
//         ],
//         controller: _numOfRobotsOnChargeStationAtEndController,
//       ),
    
//       ScoutingCheckbox(
//         controller: _autoDidRobotComeOutOfComunityController,
//         onChanged: (value) => setState(() {
//           _autoDidRobotComeOutOfComunityController.value = value!;
//         }), 
//       ),
    
//       ElevatedButton(
//         onPressed: widget.exit,
//         child: null
//       ),
  
//       ElevatedButton(
//         onPressed: (() => InsertScoutingDataTable.newTable(
//           //matchId: widget.matchId,
//           //teamId: widget.teamId,
//           //alliance: widget.alliance,
//           //winLoseOrTie: _winLoseOrTieController.value ? '1' : '0',
//           //startingPosition: _startingPositionController.value,
//           //wasRobotOnField: _wasRobotOnFieldController.value ? '1' : '0',
//           //didRobotWorkInAuto: _didRobotWorkInAutoController.value ? '1' : '0',
//           //didRobotWorkInTeleOp: _didRobotWorkInTeleOpController.value ? '1' : '0',
//           //defenseComments: _defenseCommentsController.text,
//           //robotComments: _robotCommentsController.text,
//           //scouterName: _scouterNameController.text,
//           //didDefendTeleOp: _didDefendTeleOpController.value ? '1' : '0',
//           //didGetDefendedTeleOp: _didGetDefendedTeleOpController.value ? '1' : '0',
//           //didDefendEndGame: _didDefendEndGameController.value ? '1' : '0',
//           //didGetDefendedEndGame: _didGetDefendedEndGameController.value ? '1' : '0',
//           //startingItemOnRobot: _startingItemOnRobotController.value,
//           //rowOneCubes: _rowOneCubesController.value,
//           //tryRowOneCubes: _tryRowOneCubesController.value,
//           //rowTwoCubes: _rowTwoCubesController.value,
//           //tryRowTwoCubes: _tryRowTwoCubesController.value,
//           //rowThreeCubes: _rowThreeCubesController.value,
//           //tryRowThreeCubes: _tryRowThreeCubesController.value,
//           //rowOneCones: _rowOneConesController.value,
//           //tryRowOneCones: _tryRowOneConesController.value,
//           //rowTwoCones: _rowTwoConesController.value,
//           //tryRowTwoCones: _tryRowTwoConesController.value,
//           //rowThreeCones: _rowThreeConesController.value,
//           //tryRowThreeCones: _tryRowThreeConesController.value,
//           //didFeed: _didFeedController.value ? '1' : '0',
//           //numOfCubesGatheredIntoComunity: _numOfCubesGatheredIntoComunityController.value,
//           //numOfConesGatheredIntoComunity: _numOfConesGatheredIntoComunityController.value,
//           //numOfSecondsOnChargeStation: _numOfSecondsOnChargeStationController.value,
//           //numSecondsBeforeEndPivotedToChargeStation: _numSecondsBeforeEndPivotedToChargeStationController.value,
//           //didGoOnChargeStation: _didGoOnChargeStationController.value ? '1' : '0',
//           //autoChargeStationStatus: _autoChargeStationStatusController.value,
//           //endGameChargeStationStatus: _endGameChargeStationStatusController.value,
//           //teleopWasRobotParked: _teleopWasRobotParkedController.value ? '1' : '0',
//           //autoNumOfSecondsUntilBalanced: _autoNumOfSecondsUntilBalancedController.value,
//           //endgameNumOfSecondsUntilBalanced: _endgameNumOfSecondsUntilBalancedController.value,
//           //fromWhereRobotDroveToChargeStation: _fromWhereRobotDroveToChargeStationController.value,
//           //numOfRobotsOnChargeStationAtEnd: _numOfRobotsOnChargeStationAtEndController.value,
//           //autoDidRobotComeOutOfComunity: _autoDidRobotComeOutOfComunityController.value ? '1' : '0',

//         )),
//         child: null
//       )
    
//         ]
//       )
//     );
//   */
//   }
// }
