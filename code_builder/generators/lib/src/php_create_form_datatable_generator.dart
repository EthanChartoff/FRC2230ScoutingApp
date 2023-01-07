import 'dart:async';

import 'package:build/build.dart';
import 'package:generators/items/items.dart';


class CreatePhpScoutingDataTableBuilder extends Builder {

  final List<ScoutingGenerationItem> formItems;

  CreatePhpScoutingDataTableBuilder({
    required this.formItems
  });

  String get createScoutingDataTable {
    var buffer = StringBuffer();

    buffer.write('''
<?php
include_once 'conn.php';
include_once 'constants.php';


\$sql = "CREATE TABLE \$scouting_table($tableItems)";

if (\$conn->query(\$sql) === TRUE) {
  echo "Table created successfully :) ";
} else {
  echo "Error creating table: " . \$conn->error;
}

\$conn->close();
?>
''');

    return buffer.toString();
  }

  String get tableItems {
    var buffer = StringBuffer();
    
    buffer.writeln();

    /// values
    formItems.forEach((element) {
      buffer.writeln(element.sqlParamValue);
    });

    /// constraints
    // ignore: omit_local_variable_types
    Iterable<ScoutingGenerationItem> itemsWithConstraints = formItems.where((element) => 
      element.sqlConstraintsValue != null);

    itemsWithConstraints.toList().getRange(0, itemsWithConstraints.length - 1)
    .forEach((element) {
      buffer.writeln('${element.sqlConstraintsValue},');  
    });
    buffer.writeln(itemsWithConstraints
    .elementAt(itemsWithConstraints.length - 1).sqlConstraintsValue);
    
    return buffer.toString();
  }
    
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var copyId = inputId.changeExtension('.g_create_scouting_table.php');

    var contents = await buildStep.readAsString(inputId);

    await buildStep.writeAsString(copyId, createScoutingDataTable);
  }
  
  @override
  Map<String, List<String>> get buildExtensions => 
    {'.txt': ['.g_create_scouting_table.php']}; 
}