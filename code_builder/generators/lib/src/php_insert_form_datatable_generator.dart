import 'dart:async';

import 'package:build/build.dart';
import 'package:generators/items/items.dart';


class InsertPhpScoutingDataTableBuilder extends Builder {

  final List<ScoutingGenerationItem> formItems;

  InsertPhpScoutingDataTableBuilder({
    required this.formItems
  }); 

  String get insertScoutingDataTable {
    var buffer = StringBuffer();

    buffer.write('''
<?php

include_once 'conn.php';
include_once 'constants.php';

function sendJsonResponse(\$response)
{
    header('Content-Type: application/json');
    echo json_encode(\$response);
}


$postFields


$sqlInsert


if(\$conn->query(\$sqlinsert) === TRUE) {
    \$response = array('status' => 'success :)', 'data' => null);
    echo(\$response);
    sendJsonResponse(\$response);

}
else {
    \$response = array('status' => 'failed :(', 'data' => null);
    echo(\$response);
    sendJsonResponse(\$response);
}
?>
''');

    return buffer.toString();
  }

  String get postFields {
    var buffer = StringBuffer();

    formItems.forEach((element) {
      final elementName = element.name; 
      buffer.writeln("\$$elementName = \$_POST['$elementName'];");
    });

    return buffer.toString();
  } 

  String get sqlInsert {
    var buffer = StringBuffer();

    // TODO: make generator for table builder
    buffer.write('\$sqlinsert = "INSERT INTO \$scouting_table($paramNames) VALUES ($paramValues)";');

    return buffer.toString();
  }

  String get paramNames {
    var buffer = StringBuffer();
    
    buffer.writeln();
    formItems.getRange(0, formItems.length - 1).forEach((element) {
      buffer.writeln('    `${element.name}`,');
    });
    buffer.writeln('    `${formItems.elementAt(formItems.length - 1).name}`');
    return buffer.toString();
  }

  String get paramValues {
    var buffer = StringBuffer();

    buffer.writeln();

    /// defualt params values
    formItems.getRange(0, 2).forEach((element) {
      buffer.writeln('    DEFAULT,');
    });

    /// posted params values
    formItems.getRange(2, formItems.length - 1).forEach((element) {
      buffer.writeln("    '\$${element.name}',");
    });
    buffer.writeln("    '\$${formItems.elementAt(formItems.length - 1).name}'");


    return buffer.toString();
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var copyId = inputId.changeExtension('.g_insert_table.php');

    await buildStep.writeAsString(copyId, insertScoutingDataTable);

  }

  @override
  Map<String, List<String>> get buildExtensions =>  
    {'.txt': ['.g_insert_table.php']};
}