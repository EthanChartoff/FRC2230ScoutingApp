import 'dart:async';

import 'package:build/build.dart';
import 'package:generators/items/items.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';


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


\$sql = "CREATE TABLE $tableName($tableItems)"

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
    /// default type for every table 
    buffer.writeln('id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,');
    formItems.forEach((element) {
      buffer.writeln(element.sqlParamValue);
    });
    /// default type for every table 
    buffer.writeln
      ('created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP');

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