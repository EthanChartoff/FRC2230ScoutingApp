import 'dart:async';

import 'package:build/build.dart';
import 'package:generators/items/items.dart';


class CreatePhpScoutingDataTableBuilder extends Builder {

  final List<ScoutingGenerationItem> formItems;

  CreatePhpScoutingDataTableBuilder({
    required this.formItems
  });

  String createScoutingDataTable(String tableName) {
    var buffer = StringBuffer();

    buffer.write('''
<?php
include_once 'conn.php';


\$sql = "CREATE TABLE $tableName($tableItems)";

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
    formItems.where((element) => element.sqlConstraintsValue != null)
    .forEach((element) {
      buffer.writeln(element.sqlConstraintsValue);  
    });
    
    return buffer.toString();
  }
    
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var copyId = inputId.changeExtension('.g_create_scouting_table.php');

    var contents = await buildStep.readAsString(inputId);

    await buildStep.writeAsString(copyId, createScoutingDataTable(contents));
  }
  
  @override
  // TODO: implement buildExtensions
  Map<String, List<String>> get buildExtensions => 
    {'.txt': ['.g_create_scouting_table.php']}; 
}