import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';


class ScoutingFormGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {    
    var buffer = StringBuffer();

    buffer.write('''
      class ScoutingForm extends StatefulWidget {

        final void Function() exit;

        const ScoutingForm({
          required this.exit
        });

        @override
        State<StatefulWidget> createState() => _ScoutingFormState();
      }
    ''');

    return DartFormatter().format(buffer.toString());
  }  
}

class ScoutingFormStateGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    final emmiter = DartEmitter();

    
  }