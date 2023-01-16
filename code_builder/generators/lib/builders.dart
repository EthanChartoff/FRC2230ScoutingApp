import 'package:build/build.dart';
import 'package:generators/items/items.dart';
import 'package:generators/items/items_enums.dart';
import 'package:generators/src/php_create_form_datatable_generator.dart';
import 'package:generators/src/insert_form_datatable_generator.dart';
import 'package:generators/src/php_insert_form_datatable_generator.dart';
import 'package:generators/src/teams_generator.dart';
import 'package:source_gen/source_gen.dart';

import 'src/form_generator.dart';

// import 'package:flutter/material.dart' show DropdownMenuItem, Text;
final defaultItems = 
[
  ScoutingGenerationField(
    name: 'id',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'id', 
      type: SqlParamType.SMALLINT,
      typeLengthValue: 6,
      key: KeyType.PRIMARY_KEY,
      attributes: Attributes.UNSIGNED,
      autoIncrement: true
    )
  ),

  ScoutingGenerationField(
    name: 'lastChangedAt', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'lastChangedAt', 
      type: SqlParamType.TIMESTAMP,
      defaultType: DefaultType.CURRENT_TIMESTAMP
    )
  ),

  ScoutingGenerationField(
    name: 'matchId',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'matchId', 
      type: SqlParamType.SMALLINT,
      typeLengthValue: 6,
    ),
    sqlConstraintsValue: ScoutingGenerationItem.sqlConstraints(
      name: 'matchId', 
      constraints: MapEntry(ConstraintsTables.MATCHES, 'id')
    )
  ),

  ScoutingGenerationField(
    name: 'teamId', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'teamId', 
      type: SqlParamType.VARCHAR,
      typeLengthValue: 4,
    ),
    sqlConstraintsValue: ScoutingGenerationItem.sqlConstraints(
      name: 'teamId', 
      constraints: MapEntry(ConstraintsTables.TEAMS, 'id')
    )
  ),

  ScoutingGenerationField(
    name: 'alliance', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'alliance', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    )
  ),

  ScoutingGenerationCheckbox(
    name: 'winLoseOrTie', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'winLoseOrTie', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot win, lose or tie?'
  ),

  ScoutingGenerationDropdownButtonFormField(
    name: 'startingPosition', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'startingPosition', 
      type: SqlParamType.CHAR,
      typeLengthValue: 1
    ), 
    dropdownMenuItems: const {
      'blue 1' : '1',
      'blue 2' : '2',
      'blue 3' : '3',
      'red 1' : '4',
      'red 2' : '5',
      'red 3' : '6',
    }
  ),

  ScoutingGenerationCheckbox(
    name: 'wasRobotOnField', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'wasRobotOnField', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    )
  ),

  ScoutingGenerationCheckbox(
    name: 'didRobotWorkInAuto',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didRobotWorkInAuto', 
      type: SqlParamType.TINYINT,
      typeLengthValue:  1
    )
  ),

  ScoutingGenerationCheckbox(
    name: 'didRobotWorkInTeleOp',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didRobotWorkInTeleOp', 
      type: SqlParamType.TINYINT,
      typeLengthValue:  1
    )
  ),

  ScoutingGenerationTextFormField(
    name: 'defenseComments', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'defenseComments', 
      type: SqlParamType.TINYTEXT
    )
  ),

  ScoutingGenerationTextFormField(
    name: 'robotComments', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'robotComments', 
      type: SqlParamType.TINYTEXT
    )
  ),

  ScoutingGenerationTextFormField(
    name: 'scouterName', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'scouterName', 
      type: SqlParamType.TINYTEXT
    )
  ),
];

final formitems = 
[
  ScoutingGenerationCheckbox(
    name: 'didDefendTeleOp', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didDefendTeleOp', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot defend in teleop?'
  ),

  ScoutingGenerationCheckbox(
    name: 'didGetDefendedTeleOp', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didGetDefendedTeleOp', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot get defended in teleop?'
  ),

  ScoutingGenerationCheckbox(
    name: 'didDefendEndGame', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didDefendEndGame', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot defend in endgame?'
  ),

  ScoutingGenerationCheckbox(
    name: 'didGetDefendedEndGame', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didGetDefendedEndGame', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot get defended in endgame?'
  ),

  /// TODO: make a convention for naming cube/cones/none, maybe:
  /// Cube: b,
  /// Cone: c,
  /// None: n
  ScoutingGenerationDropdownButtonFormField(
    name: 'startingItemOnRobot', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'startingItemOnRobot', 
      type: SqlParamType.CHAR,
      typeLengthValue: 1
    ),
    dropdownMenuItems: {
      'cube' : 'b',
      'cone' : 'c',
      'none' : 'n',
    }),

    /// game items counters
    ScoutingGenerationShotCounter(
      name: 'rowOneCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowOneCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowOneCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowOneCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),
    
    ScoutingGenerationShotCounter(
      name: 'rowTwoCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowTwoCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowTwoCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowTwoCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'rowThreeCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowThreeCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowThreeCubes', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowThreeCubes', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'rowOneCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowOneCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowOneCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowOneCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'rowTwoCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowTwoCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowTwoCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowTwoCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'rowThreeCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'rowThreeCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'tryRowThreeCones', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'tryRowThreeCones', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationCheckbox(
      name: 'didFeed', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'didFeed', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
      title: 'did robot feed?'
    ),
    
    ScoutingGenerationShotCounter(
      name: 'numOfCubesGatheredIntoComunity', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'numOfCubesGatheredToComunity', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationShotCounter(
      name: 'numOfConesGatheredIntoComunity', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'numOfConesGatheredToComunity', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 2
      ),
    ),

    ScoutingGenerationButtonTimer(
      name: 'numOfSecondsOnChargeStation',
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'numOfSecondsOnChargeStation', 
        type: SqlParamType.FLOAT,
      ),
    ),
     
    ScoutingGenerationButtonTimer(
      name: 'numSecondsBeforeEndPivotedToChargeStation', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'numSecondsBeforeEndPivotedToChargeStation', 
        type: SqlParamType.FLOAT,
      ),
    ),

    ScoutingGenerationCheckbox(
      name: 'didGoOnChargeStation', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'didGoOnChargeStation', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),
    
    ScoutingGenerationDropdownButtonFormField(
      name: 'autoChargeStationStatus', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'autoChargeStationStatus', 
        type: SqlParamType.CHAR,
        typeLengthValue: 1
      ),
      dropdownMenuItems: {
        'docked' : 'd',
        'parked' : 'p',
        'none' : 'n',
      },
    ),

    ScoutingGenerationDropdownButtonFormField(
      name: 'endGameChargeStationStatus', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'endGameChargeStationStatus', 
        type: SqlParamType.CHAR,
        typeLengthValue: 1
      ),
      dropdownMenuItems: {
        'docked' : 'd',
        'parked' : 'p',
        'none' : 'n',
      },
    ),

    ScoutingGenerationCheckbox(
      name: 'teleopWasRobotParked', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'teleopWasRobotParked', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
      title: 'was robot parked in teleop?'
    ),

    ScoutingGenerationButtonTimer(
      name: 'autoNumOfSecondsUntilBalanced',
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'autoNumOfSecondsUntilBalanced', 
        type: SqlParamType.FLOAT,
      ),
    ),

    ScoutingGenerationButtonTimer(
      name: 'endgameNumOfSecondsUntilBalanced',
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'endgameNumOfSecondsUntilBalanced', 
        type: SqlParamType.FLOAT,
      ),
    ),

    ScoutingGenerationDropdownButtonFormField(
      name: 'fromWhereRobotDroveToChargeStation', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'fromWhereRobotDroveToChargeStation', 
        type: SqlParamType.CHAR,
        typeLengthValue: 1
      ),
      dropdownMenuItems: {
        'comunity' : 'c',
        'out' : 'o',
      }
    ),

    ScoutingGenerationDropdownButtonFormField(
      name: 'numOfRobotsOnChargeStationAtEnd', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'numOfRobotsOnChargeStationAtEnd', 
        type: SqlParamType.CHAR,
        typeLengthValue: 1
      ),
      dropdownMenuItems: {
        '0' : '0',
        '1' : '1',
        '2' : '2',
        '3' : '3',
      }
    ),

    ScoutingGenerationCheckbox(
      name: 'autoDidRobotComeOutOfComunity', 
      sqlParamValue: ScoutingGenerationItem.sqlParam(
        name: 'autoDidRobotComeOutOfComunity', 
        type: SqlParamType.TINYINT,
        typeLengthValue: 1
      ),
    ),

    /// # auto route by hand
];  

final items = defaultItems + formitems; 

Builder scoutingFormGeneratorBuilder(BuilderOptions options) =>
  SharedPartBuilder([ScoutingFormGenerator()], 'scouting_form');

Builder scoutingFormStateGeneratorBuilder(BuilderOptions options) =>
  SharedPartBuilder([ScoutingFormStateGenerator(formItems: items)], 'scouting_form_state');

Builder insertDartScoutingDataTableBuilder(BuilderOptions options) =>
  InsertDartScoutingDataTableBuilder(formItems: items);

Builder createPhpScoutingDataTableBuilder(BuilderOptions options) =>
  CreatePhpScoutingDataTableBuilder(formItems: items);

Builder insertPhpScoutingDataTableBuilder(BuilderOptions options) =>
  InsertPhpScoutingDataTableBuilder(formItems: items);

// Builder teamsBuilder(BuilderOptions options) =>
//   TeamsBuilder();
  


