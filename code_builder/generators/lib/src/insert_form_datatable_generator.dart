import 'dart:async';

import 'package:build/build.dart';
import 'package:generators/items/items.dart';
import 'package:dart_style/dart_style.dart';


class InsertDartScoutingDataTableBuilder extends Builder {

  final List<ScoutingGenerationItem> formItems;

  InsertDartScoutingDataTableBuilder({
    required this.formItems
  });

  String get insertScoutingDataTable {
    var buffer = StringBuffer();
     

    buffer.writeln("import 'package:http/http.dart' as http;");
    buffer.writeln();

    /// TODO: change url according to  
    buffer.write("""
      class InsertScoutingDataTable {
        static void newTable({$insertScoutingDataTableFields}) async {
          try {
            final response = await http.post(
              Uri.parse('http://172.16.14.79/2230_scouting/new_scouting_data_table.php'),
              body: {$insertScoutingDataTableBody}
            );
          } catch (err) {
            // print('\$err lol');
            throw Exception('\$err');
          }
        }
      }
""");
    return DartFormatter().format(buffer.toString());
  }

  String get insertScoutingDataTableFields {
    var buffer = StringBuffer();

    formItems.getRange(2, formItems.length).forEach((element) {
      buffer.writeln('required ${element.name},');
    });

    return buffer.toString();
  }

  String get insertScoutingDataTableBody {
    var buffer = StringBuffer();
    
    /// defualt params
    formItems.getRange(0, 2).forEach((element) {
      buffer.writeln("'${element.name}' : '',");
    });

    /// required params
    formItems.getRange(2, formItems.length).forEach((element) { 
      buffer.writeln("'${element.name}' : '\$${element.name}',");
    });

    return buffer.toString();
  }
  
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var inputId = buildStep.inputId;
    var copyId = inputId.changeExtension('.g_insert_table.dart');

    await buildStep.writeAsString(copyId, insertScoutingDataTable);
  }

  @override
  Map<String, List<String>> get buildExtensions => {'.dart': ['.g_insert_table.dart']};
  
}