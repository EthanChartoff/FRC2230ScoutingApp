import 'dart:math';

import 'package:generators/items/items_enums.dart';


class ScoutingGenerationItem {

  final String name;

  final String sqlParamValue;

  final String? sqlConstraintsValue;

  const ScoutingGenerationItem({
    required this.name,
    required this.sqlParamValue,
    this.sqlConstraintsValue
  });

  /// TODO: add bit tyoe
  ScoutingGenerationItemTypes? get type => null;

  static String sqlParam({
    required String name,
    required SqlParamType type,
    int? typeLengthValue,
    Attributes? attributes,
    bool isNull = false,
    DefaultType? defaultType,
    String? defaultTypeValue,
    bool autoIncrement = false,
    KeyType? key,
  }) {
    if((defaultType == DefaultType.NULL && !isNull)) {
      throw Exception('If default is null, isNull flag must be true');
    }
    else if (autoIncrement && defaultType != null) {
      throw Exception('If auto increment is enabled, default must be none');
    } 

    var param = '$name ${type.name}';
    
    if(!(
      type == SqlParamType.TEXT || 
      type == SqlParamType.LONGTEXT || 
      type == SqlParamType.TINYTEXT ||
      type == SqlParamType.DOUBLE ||
      type == SqlParamType.FLOAT ||
      type == SqlParamType.TIMESTAMP
    )) {
        if(typeLengthValue == null) {
          throw Exception('${type.name} must have a length/value');
        } else {
          param = param + '($typeLengthValue)';
        }
      }
    


    if(attributes != null) {
      param = param + ' ${attributes.name.replaceAll(RegExp(r'_'), ' ')}';
    }

    if(!isNull) {
      param = param + ' NOT';
    }
    param = param + ' NULL';

    if(defaultType != null) {
      if(defaultType == DefaultType.AS_DEFINED) {
        param = param + " DEFAULT '$defaultTypeValue'";
      }
      else {
        param = param + ' DEFAULT ${defaultType.name}';
      }
    }

    if(autoIncrement) {
      param = param + ' AUTO_INCREMENT';
    }

    if(key != null) {
      param = param + ' ${key.name.replaceAll(RegExp(r'_'), ' ')}';
    }

    return param + ',';
  }

  static String sqlConstraints({
    required String name,
    required MapEntry<ConstraintsTables, String> constraints,
  }) {
    return 'CONSTRAINT ${name}_fk FOREIGN KEY ($name) REFERENCES ${constraints.key.name.toLowerCase()}(${constraints.value})';
  }
}

class ScoutingGenerationField extends ScoutingGenerationItem {

  ScoutingGenerationField({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.Field;
}

class ScoutingGenerationShotCounter extends ScoutingGenerationItem { 
  
  final int score;

  const ScoutingGenerationShotCounter({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue,
    this.score = 0
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.ScoutingShotCounter;
}

class ScoutingGenerationDropdownButtonFormField extends ScoutingGenerationItem {

  /// key: name of item
  /// value: value of item
  final Map<String, String> dropdownMenuItems;

  const ScoutingGenerationDropdownButtonFormField({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue,
    required this.dropdownMenuItems
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.ScoutingDropdownButtonFormField;
}

class ScoutingGenerationTextFormField extends ScoutingGenerationItem {
  const ScoutingGenerationTextFormField({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue,
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.ScoutingTextFormField;
}

class ScoutingGenerationCheckbox extends ScoutingGenerationItem {

  final String? title;

  const ScoutingGenerationCheckbox({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue,
    this.title
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue,
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.ScoutingCheckbox;
}

class ScoutingGenerationButtonTimer extends ScoutingGenerationItem {
  const ScoutingGenerationButtonTimer({
    required String name,
    required String sqlParamValue,
    String? sqlConstraintsValue
  }) : super(
    name: name,
    sqlParamValue: sqlParamValue,
    sqlConstraintsValue: sqlConstraintsValue
  );

  @override
  ScoutingGenerationItemTypes get type => 
    ScoutingGenerationItemTypes.ScoutingButtonTimer;
}

