import 'package:build/build.dart';
import 'package:generators/items/items.dart';
import 'package:generators/items/items_enums.dart';
import 'package:generators/src/php_create_form_datatable_generator.dart';
import 'package:generators/src/insert_form_datatable_generator.dart';
import 'package:generators/src/php_insert_form_datatable_generator.dart';
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

  ScoutingGenerationCheckbox(
    name: 'didRobotWin', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didRobotWin', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    ),
    title: 'did robot win?'
  ),

  ScoutingGenerationField(
    name: 'alliance', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'alliance', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    )
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

  ScoutingGenerationCheckbox(
    name: 'didRobotDefend',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'didRobotDefend', 
      type: SqlParamType.TINYINT,
      typeLengthValue:  1
    )
  ),

  ScoutingGenerationCheckbox(
    name: 'wasStrategyDifferent',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'wasStrategyDifferent', 
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
    name: 'strategyComments', 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'strategyComments', 
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
  ScoutingGenerationShotCounter(
    name: 'shotCounter1',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'shotCounter1', 
      type: SqlParamType.TINYINT, 
      typeLengthValue: 3,
      attributes: Attributes.UNSIGNED
    )
  ),

  ScoutingGenerationShotCounter(
    name: 'shotCounter2',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'shotCounter2', 
      type: SqlParamType.TINYINT, 
      typeLengthValue: 4,
      attributes: Attributes.UNSIGNED
    )
  ),

  ScoutingGenerationDropdownButtonFormField(
    name: 'dropdownButton',
    dropdownMenuItems: const {
      'comp 1' : '1',
      'comp 2' : '2',
      'comp 3' : '3',
      'comp 4' : '4',
      'comp 5' : '5',
    }, 
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'dropdownButton', 
      type: SqlParamType.CHAR, 
      typeLengthValue: 1
    )
  ),

  ScoutingGenerationTextFormField(
    name: 'textfield',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'textfield', 
      type: SqlParamType.TEXT, 
    )
  ),

  ScoutingGenerationCheckbox(
    name: 'checkbox',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'checkbox', 
      type: SqlParamType.TINYINT,
      typeLengthValue: 1
    )
  ),

  ScoutingGenerationButtonTimer(
    name: 'buttonTimer',
    sqlParamValue: ScoutingGenerationItem.sqlParam(
      name: 'buttonTimer', 
      type: SqlParamType.FLOAT
    )
  ),
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
  


