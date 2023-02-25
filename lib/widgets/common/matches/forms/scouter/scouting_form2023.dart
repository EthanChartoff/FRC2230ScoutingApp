/// MOST OF THE CODE IS GENERATED, BE CAREFUL WHEN EDITING


import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/api/2230_database/dart/get/gets_scouting_table.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/matches.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/new_scouting_data_table2023.dart';
import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/counter.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/snackbar.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/textfield.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/timed_button.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/title.dart';


class ScoutingForm2023 extends StatefulWidget {
  const ScoutingForm2023({
    required this.exit,
    required this.matchId,
    required this.teamId,
    required this.alliance,
    required this.matchNum,
    });

    final void Function() exit;

    final String matchId;
    final String teamId;
    final String alliance;
    final String matchNum;

  @override
  State<StatefulWidget> createState() => _ScoutingForm2023State();
}

class _ScoutingForm2023State extends State<ScoutingForm2023> {

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

  final ValueNotifier<String> _startingItemOnRobotController =
      ValueNotifier<String>('');

  final ValueNotifier<int> _autoRowOneCubesController = 
      ValueNotifier<int>(0);

  final ValueNotifier<int> _tryAutoRowOneCubesController =
      ValueNotifier<int>(0);

  final ValueNotifier<int> _autoRowTwoCubesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _tryAutoRowTwoCubesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _autoRowThreeCubesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _tryAutoRowThreeCubesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _autoRowOneConesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _tryAutoRowOneConesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _autoRowTwoConesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _tryAutoRowTwoConesController =
      ValueNotifier<int>(0);
  
  final ValueNotifier<int> _autoRowThreeConesController =
      ValueNotifier<int>(0);
      
  final ValueNotifier<int> _tryAutoRowThreeConesController =
      ValueNotifier<int>(0); 
    
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

  /// TODO: add
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
    
  final ValueNotifier<String> _numOfRobotsOnChargeStationController = 
      ValueNotifier<String>('');

  final ValueNotifier<bool> _autoDidRobotComeOutOfComunityController =
      ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _startingPositionController.dispose();
    _wasRobotOnFieldController.dispose();
    _didRobotWorkInAutoController.dispose();
    _didRobotWorkInTeleOpController.dispose();
    _defenseCommentsController.dispose();
    _robotCommentsController.dispose();
    _scouterNameController.dispose();
    _didDefendTeleOpController.dispose();
    _didGetDefendedTeleOpController.dispose();
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
    _numSecondsBeforeEndPivotedToChargeStationController.dispose();
    _autoChargeStationStatusController.dispose();
    _endGameChargeStationStatusController.dispose();
    _autoNumOfSecondsUntilBalancedController.dispose();
    _endgameNumOfSecondsUntilBalancedController.dispose();
    _fromWhereRobotDroveToChargeStationController.dispose();
    _numOfRobotsOnChargeStationAtEndController.dispose();
    _numOfRobotsOnChargeStationController.dispose();
    _autoDidRobotComeOutOfComunityController.dispose();

    super.dispose();
  }

  /// Makes sure that the value of [dependent] is always greater than or equal 
  /// to the value of [notDependent].
  void counterCantBeLower({
    required ValueNotifier<int> dependent,
    required ValueNotifier<int> notDependent,
  }) {
    if (dependent.value < notDependent.value) {
      setState(() {
        dependent.value = notDependent.value;
      });
    }
  }

  /// Makes sure that the value of [dependent] is always less than or equal to
  /// the value of [notDependent].
  void counterCantBeHigher({
    required ValueNotifier<int> dependent,
    required ValueNotifier<int> notDependent,
  }) {
    if (dependent.value > notDependent.value) {
      setState(() {
        dependent.value = notDependent.value;
      });
    }
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text(
                          AppLocalizations.of(context).matchNumber(
                            widget.matchNum
                          ),
                          style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 24    ,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ScoutingTextFormField(
              controller: _scouterNameController,
              onChanged: (value) => setState(() {}),
              labelText: AppLocalizations.of(context).scoutersName,
            ),

            ScoutingCheckbox(
              controller: _wasRobotOnFieldController,
              onChanged: (value) => setState(() {
                _wasRobotOnFieldController.value = value!;
              }),
              title: AppLocalizations.of(context).wasRobotOnField, 
            ),

            ScoutingDropdownButtonFormField(
              items: widget.alliance == 'B' ? const [
                DropdownMenuItem(value: 'B1', child: Text('blue 1')),
                DropdownMenuItem(value: 'B2', child: Text('blue 2')),
                DropdownMenuItem(value: 'B3', child: Text('blue 3')),
              ] : const [
                DropdownMenuItem(value: 'R1', child: Text('red 1')),
                DropdownMenuItem(value: 'R2', child: Text('red 2')),
                DropdownMenuItem(value: 'R3', child: Text('red 3')),
              ],
              controller: _startingPositionController,
              hint: AppLocalizations.of(context).startingPos,
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'CUBE', child: Text('cube')),
                DropdownMenuItem(value: 'CONE', child: Text('cone')),
                DropdownMenuItem(value: 'NONE', child: Text('none')),
              ],
              controller: _startingItemOnRobotController,
              hint: AppLocalizations.of(context).startingItemOnRobot,
            ),

            /// # Data points specific for the autonomous period.
            ScoutingTitle(
              title: AppLocalizations.of(context).auto
            ),

            ScoutingCheckbox(
              controller: _didRobotWorkInAutoController,
              onChanged: (value) => setState(() {
                _didRobotWorkInAutoController.value = value!;
              }), 
              title: AppLocalizations.of(context).didRobotWorkInAuto,
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'DOCKED', child: Text('docked')),
                DropdownMenuItem(value: 'ENGAGED', child: Text('engaged')),
                DropdownMenuItem(value: 'NONE', child: Text('none')),
              ],
              controller: _autoChargeStationStatusController,
              hint: AppLocalizations.of(context).autoChargeStationStatus,
            ),

            ScoutingCheckbox(
              controller: _autoDidRobotComeOutOfComunityController,
              onChanged: (value) => setState(() {
                _autoDidRobotComeOutOfComunityController.value = value!;
              }), 
              title: AppLocalizations.of(context).autoDidComeOutOfComunity,
            ),

            // ## auto game item scored.
            Table(
              children: [
                TableRow(
                  children: [
                    ScoutingShotCounter(
                      controller: _tryAutoRowOneCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowOneCubesController,
                        notDependent: _tryAutoRowOneCubesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowOneCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).low 
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowOneCubesController,
                        notDependent: _autoRowOneCubesController,
                      ),
                    ),

                    ScoutingShotCounter(
                      controller: _tryAutoRowTwoCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowTwoCubesController,
                        notDependent: _tryAutoRowTwoCubesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowTwoCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowTwoCubesController,
                        notDependent: _autoRowTwoCubesController,
                      ),
                    ),

                    ScoutingShotCounter(
                      controller: _tryAutoRowThreeCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowThreeCubesController,
                        notDependent: _tryAutoRowThreeCubesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowThreeCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowThreeCubesController,
                        notDependent: _autoRowThreeCubesController,
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: [
                    ScoutingShotCounter(
                      controller: _tryAutoRowOneConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowOneConesController,
                        notDependent: _tryAutoRowOneConesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowOneConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowOneConesController,
                        notDependent: _autoRowOneConesController,
                      ),
                    ),

                    ScoutingShotCounter(
                      controller: _tryAutoRowTwoConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowTwoConesController,
                        notDependent: _tryAutoRowTwoConesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowTwoConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowTwoConesController,
                        notDependent: _autoRowTwoConesController,
                      ),
                    ),

                    ScoutingShotCounter(
                      controller: _tryAutoRowThreeConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _autoRowThreeConesController,
                        notDependent: _tryAutoRowThreeConesController,
                      ),
                    ),
                    ScoutingShotCounter(
                      controller: _autoRowThreeConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryAutoRowThreeConesController,
                        notDependent: _autoRowThreeConesController,
                      ),
                    ),
                  ]
                )
              ],
            ),
              
            ScoutingButtonTimer(
              controller: _autoNumOfSecondsUntilBalancedController,
              title: AppLocalizations.of(context)
                .autoTimeUntilBalancedOnChargeStation,
            ),

            /// # Data points specific for the teleoperated period.
            ScoutingTitle(
              title: AppLocalizations.of(context).teleop,
            ),

            ScoutingCheckbox(
              controller: _didRobotWorkInTeleOpController,
              onChanged: (value) => setState(() {
                _didRobotWorkInTeleOpController.value = value!;
              }), 
              title: AppLocalizations.of(context).didRobotWorkInTeleop,
            ),

            ScoutingCheckbox(
              controller: _didDefendTeleOpController,
              onChanged: (value) => setState(() {
                _didDefendTeleOpController.value = value!;
              }), 
              title: AppLocalizations.of(context).teleopDidRobotDefend,
            ),
            
            ScoutingCheckbox(
              controller: _didGetDefendedTeleOpController,
              onChanged: (value) => setState(() {
                _didGetDefendedTeleOpController.value = value!;
              }), 
              title: AppLocalizations.of(context).teleopDidRobotGetDefended,
            ),

            ScoutingCheckbox(
              controller: _didFeedController,
              onChanged: (value) => setState(() {
                _didFeedController.value = value!;
              }), 
              title: AppLocalizations.of(context).teleopDidRobotFeed,
            ),

            /// ## game items scored.
            
            Table(
              children: [
                TableRow(
                  children: [
                    ScoutingShotCounter(
                      controller: _tryRowOneCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowOneCubesController,
                        notDependent: _tryRowOneCubesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowOneCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowOneCubesController,
                        notDependent: _rowOneCubesController
                      )
                    ),

                    ScoutingShotCounter(
                      controller: _tryRowTwoCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowTwoCubesController,
                        notDependent: _tryRowTwoCubesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowTwoCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowTwoCubesController,
                        notDependent: _rowTwoCubesController
                      )
                    ),

                    ScoutingShotCounter(
                      controller: _tryRowThreeCubesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowThreeCubesController,
                        notDependent: _tryRowThreeCubesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowThreeCubesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cube,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowThreeCubesController,
                        notDependent: _rowThreeCubesController
                      )
                    ),
                  ]
                ),
                TableRow(
                  children: [
                    ScoutingShotCounter(
                      controller: _tryRowOneConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowOneConesController,
                        notDependent: _tryRowOneConesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowOneConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).low
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowOneConesController,
                        notDependent: _rowOneConesController
                      )
                    ),

                    ScoutingShotCounter(
                      controller: _tryRowTwoConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowTwoConesController,
                        notDependent: _tryRowTwoConesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowTwoConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).mid
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowTwoConesController,
                        notDependent: _rowTwoConesController
                      )
                    ),

                    ScoutingShotCounter(
                      controller: _tryRowThreeConesController,
                      title: AppLocalizations.of(context)
                        .attempedItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeHigher(
                        dependent: _rowThreeConesController,
                        notDependent: _tryRowThreeConesController
                      )
                    ),
                    ScoutingShotCounter(
                      controller: _rowThreeConesController,
                      title: AppLocalizations.of(context)
                        .scoredItemCounterTitle(
                          AppLocalizations.of(context).cone,
                          AppLocalizations.of(context).high
                        ),
                      onChanged: () => counterCantBeLower(
                        dependent: _tryRowThreeConesController,
                        notDependent: _rowThreeConesController
                      )
                    ),
                  ]
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScoutingShotCounter(
                  controller: _numOfCubesGatheredIntoComunityController,
                  title: AppLocalizations.of(context)
                    .gatheredIntoComunityCounterTitle(
                      AppLocalizations.of(context).cube
                    ),
                ),
                ScoutingShotCounter(
                  controller: _numOfConesGatheredIntoComunityController,
                  title: AppLocalizations.of(context)
                    .gatheredIntoComunityCounterTitle(
                      AppLocalizations.of(context).cone
                    ),
                ),
              ],
            ),
                      
            /// # Data points specific for the endgame period.
            ScoutingTitle(
              title: AppLocalizations.of(context).endgame,
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'DOCKED', child: Text('docked')),
                DropdownMenuItem(value: 'ENGAGED', child: Text('engaged')),
                DropdownMenuItem(value: 'PARKED', child: Text('parked')),
                DropdownMenuItem(value: 'NONE', child: Text('none')),
              ],
              controller: _endGameChargeStationStatusController,
              hint: AppLocalizations.of(context).endgameChargeStationStatus,
            ),

            ScoutingButtonTimer(
              controller: _endgameNumOfSecondsUntilBalancedController,
              title: AppLocalizations.of(context)
                .endgameTimeUntilBalancedOnChargeStation,
            ),
                                
            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: 'COMUNITY', child: Text('comunity')),
                DropdownMenuItem(value: 'OUT', child: Text('out')),
              ],
              controller: _fromWhereRobotDroveToChargeStationController,
              hint: AppLocalizations.of(context).endgameFromWhichSide,
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '0', child: Text('0')),
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
              ],
              controller: _numOfRobotsOnChargeStationController,
              hint: AppLocalizations.of(context).endgameNumOfRobotsBeforeRobot,
            ),

            ScoutingDropdownButtonFormField(
              items: const [
                DropdownMenuItem(value: '0', child: Text('0')),
                DropdownMenuItem(value: '1', child: Text('1')),
                DropdownMenuItem(value: '2', child: Text('2')),
                DropdownMenuItem(value: '3', child: Text('3')),
              ],
              controller: _numOfRobotsOnChargeStationAtEndController,
              hint: AppLocalizations.of(context).endgameNumOfRobotsAtEndOfMatch,
            ),

            /// # Data for when the match is done.
            ScoutingTitle(
              title: AppLocalizations.of(context).comments
            ),

            ScoutingTextFormField(
              controller: _defenseCommentsController,
              onChanged: (value) => setState(() {}),
              labelText: AppLocalizations.of(context).defenseComments,
            ),
          
            ScoutingTextFormField(
              controller: _robotCommentsController,
              onChanged: (value) => setState(() {}),
                labelText: AppLocalizations.of(context).robotComments,
            ),
                    
            ElevatedButton(
              onPressed: widget.exit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              child: Text(
                AppLocalizations.of(context).exitButton,
                style: const TextStyle(
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
                  startingPosition: _startingPositionController.value,
                  wasRobotOnField: _wasRobotOnFieldController.value ? '1' : '0',
                  didRobotWorkInAuto: _didRobotWorkInAutoController.value ? '1' : '0',
                  didRobotWorkInTeleOp: _didRobotWorkInTeleOpController.value ? '1' : '0',
                  defenseComments: _defenseCommentsController.text,
                  robotComments: _robotCommentsController.text,
                  scouterName: _scouterNameController.text,
                  didDefendTeleOp: _didDefendTeleOpController.value ? '1' : '0',
                  didGetDefendedTeleOp: _didGetDefendedTeleOpController.value ? '1' : '0',
                  startingItemOnRobot: _startingItemOnRobotController.value,

                  autoRowOneCubes: _autoRowOneCubesController.value,
                  tryAutoRowOneCubes: _tryAutoRowOneCubesController.value,
                  autoRowTwoCubes: _autoRowTwoCubesController.value,
                  tryAutoRowTwoCubes: _tryAutoRowTwoCubesController.value,
                  autoRowThreeCubes: _autoRowThreeCubesController.value,
                  tryAutoRowThreeCubes: _tryAutoRowThreeCubesController.value,
                  autoRowOneCones: _autoRowOneConesController.value,
                  tryAutoRowOneCones: _tryAutoRowOneConesController.value,
                  autoRowTwoCones: _autoRowTwoConesController.value,
                  tryAutoRowTwoCones: _tryAutoRowTwoConesController.value,
                  autoRowThreeCones: _autoRowThreeConesController.value,
                  tryAutoRowThreeCones: _tryAutoRowThreeConesController.value,

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
                  numSecondsBeforeEndPivotedToChargeStation: _numSecondsBeforeEndPivotedToChargeStationController.value,
                  autoChargeStationStatus: _autoChargeStationStatusController.value,
                  endGameChargeStationStatus : _endGameChargeStationStatusController.value,
                  autoNumOfSecondsUntilBalanced : _autoNumOfSecondsUntilBalancedController.value,
                  endgameNumOfSecondsUntilBalanced: _endgameNumOfSecondsUntilBalancedController.value,
                  fromWhereRobotDroveToChargeStation: _fromWhereRobotDroveToChargeStationController.value,
                  numOfRobotsOnChargeStation : _numOfRobotsOnChargeStationController.value,
                  numOfRobotsOnChargeStationAtEnd: _numOfRobotsOnChargeStationAtEndController.value,
                  autoDidRobotComeOutOfComunity: _autoDidRobotComeOutOfComunityController.value ? '1' : '0',
                );

                /// Check if all scouters have submitted their data,
                /// if so, the match status can be changed to which team won
                /// (or in this case tie because shvartzman said so).
                /// 
                /// TODO: determine which team won or if it was a tie.
                final matchTables = await GetScoutingData.fromMatchId(
                  widget.matchId
                );
                /// length of tables that had a unique team id.
                var uniqueTeamMatches = [];
                for (var element in matchTables) {
                  uniqueTeamMatches.contains(element['teamId']) ? 
                    null : uniqueTeamMatches.add(element['teamId']);
                }
                if(uniqueTeamMatches.length == 6) {
                  InsertMatchesDataTable2023.updateMatchStatus(
                    widget.matchId,
                    'T' // tie
                  );
                }

                widget.exit();
                
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  ScoutingSnackbar(
                    // ignore: use_build_context_synchronously
                    message: AppLocalizations.of(context).dataSavedMsg,
                  )
                );
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              child: Text(
                AppLocalizations.of(context).saveButton,
                style: const TextStyle(
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
