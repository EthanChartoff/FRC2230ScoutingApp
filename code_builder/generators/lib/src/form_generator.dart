import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

import 'package:generators/items/items_enums.dart';
import 'package:generators/items/items.dart';


/// Builds a form for scouting 
/// 
/// The class names are configured in 
/// code_builder/generated/lib/src/generated.dart
class ScoutingFormGenerator extends Generator {
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {    
    var buffer = StringBuffer();

    final _classNamesEnum = library.enums.where((element) => element.displayName == 'classNames').first.children;
    final _className = _classNamesEnum.elementAt(0).displayName;
    final _classStateName = _classNamesEnum.elementAt(1).displayName;


    buffer.write('''
      class $_className extends StatefulWidget {

        final void Function() exit;
        
        final String matchId;

        final String teamId;

        final String alliance;

        const $_className({
          required this.exit,
          required this.matchId,
          required this.teamId,
          required this.alliance
        });

        @override
        State<StatefulWidget> createState() => $_classStateName();
      }
    ''');

    return buffer.toString();
  }  
}


/// Builds the state of the scouting form created by [ScoutingFormGenerator]
/// 
/// Gets the form items from [formItems], which are configured in 
/// code_builder/generators/lib/builders.dart
class ScoutingFormStateGenerator extends Generator {

  final List<ScoutingGenerationItem> formItems;

  const ScoutingFormStateGenerator({
    required this.formItems
  });

  Iterable<ScoutingGenerationItem> get noFieldsFormItems =>
    formItems.where((element) => 
      element is! ScoutingGenerationField
    );

  /// Builds the disposed item controllers
  /// 
  /// Builds in a comment because the the generator has a bug 
  String get formItemControllersDispose {
    var buffer = StringBuffer();

    buffer.writeln('/*');
    buffer.writeln('TODO: delete /**/');

    noFieldsFormItems.forEach((element) {
      buffer.writeln('    _${element.name}Controller.dispose();');
    });
    buffer.writeln('');
    buffer.writeln('    super.dispose();');
    buffer.writeln('*/');

    return DartFormatter().format(buffer.toString());
  }

  String get bodyBuilderWrapperStart => '''
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
  ''';

  String get bodyBuilderWrapperEnd => '''
        ]
      )
    );
  ''';

  /// Button for exiting the widget
  /// 
  /// TODO: add a child
  String get bodyBuilderExitButton => '''
      ElevatedButton(
        onPressed: widget.exit,
        child: null
      ),
  ''';

  String get insertFormItems {
    var buffer = StringBuffer();

    formItems.getRange(2, formItems.length).forEach((element) {
      if(element is! ScoutingGenerationField) {
        buffer.writeln(
          '          //${element.name}: _${element.name}Controller.value,'
        );
      } 
      else {
        buffer.writeln(
          '          //${element.name}: widget.${element.name},'
        );
      }
    });

    return buffer.toString();
  }

  String bodyBuilder(Iterable<ScoutingGenerationItem> noFieldsFormItems) {
    var buffer = StringBuffer();
    final emitter = DartEmitter();

    buffer.writeln('/*');

    /// Wrapper widget of items
    buffer.write(bodyBuilderWrapperStart);

    buffer.writeln('        ///TODO: format children to here');

    noFieldsFormItems.forEach((element) { 
      if(element is ScoutingGenerationShotCounter) {
        buffer.writeln(buildShotCounterItem(element));
      } else if(element is ScoutingGenerationDropdownButtonFormField) {
        buffer.writeln(buildDropdownButtonFormField(element));
      } else if(element is ScoutingGenerationTextFormField) {
        buffer.writeln(buildTextFormField(element));
      } else if(element is ScoutingGenerationCheckbox) {
        buffer.writeln(buildCheckbox(element));
      } else if(element is ScoutingGenerationButtonTimer) {
        buffer.writeln(buildButtonTimer(element));
      } 
       
      else {
        throw Exception('Cant build for ${(element)}');
      }
    });

    buffer.writeln(bodyBuilderExitButton);

    /// TODO: add a child
    buffer.writeln('''
      ElevatedButton(
        onPressed: (() => InsertScoutingDataTable.newTable(
$insertFormItems
        )),
        child: null
      )
    ''');

    buffer.write(bodyBuilderWrapperEnd);

    buffer.writeln('*/');

    return DartFormatter().format(buffer.toString());
  }
  
  String buildShotCounterItem(ScoutingGenerationShotCounter item) {
    return '''
      ScoutingShotCounter(
        controller: _${item.name}Controller,
      ),
    ''';
  }
  
  String buildDropdownButtonFormField(ScoutingGenerationDropdownButtonFormField item) {
    return '''
      ScoutingDropdownButtonFormField(
        items: const [${buildDropdownButtonFormFieldItems(item.dropdownMenuItems)}],
        controller: _${item.name}Controller,
      ),
    ''';
  }

  String buildDropdownButtonFormFieldItems(Map<String, String> items) {
    var buffer = StringBuffer();

    buffer.writeln();

    items.forEach((key, value) {
      buffer.write('          ');
      buffer.writeln("//DropdownMenuItem(value: '$value', child: Text('$key')),");
    });
    buffer.write('        ');

    return buffer.toString();
  }
  
  String buildTextFormField(ScoutingGenerationTextFormField item) {
    return '''
      ScoutingTextFormField(
        controller: _${item.name}Controller,
        onChanged: (value) => setState(() {}),
        hint: 'input something',
        labelText: 'idk',
      ),
    ''';
  }
  
  String buildCheckbox(ScoutingGenerationCheckbox item) {
    return '''
      ScoutingCheckbox(
        controller: _${item.name}Controller,
        value: _${item.name}Controller.value,
        onChanged: (value) => setState(() {
          _${item.name}Controller.value = value;
        })
      ),
    ''';
  }
  
  String buildButtonTimer(ScoutingGenerationButtonTimer item) {
    return '''
      ScoutingButtonTimer(
        controller: _${item.name}Controller,
      ),
    ''';
  }

  
  @override
  FutureOr<String> generate(LibraryReader library, BuildStep buildStep) {
    final _emitter = DartEmitter();

    final _classNamesEnum = library.enums.where((element) => element.displayName == 'classNames').first.children;
    final _className = _classNamesEnum.elementAt(0).displayName;
    final _classStateName = _classNamesEnum.elementAt(1).displayName;

    final state = Class((c) => c
      ..name = '$_classStateName'
      ..extend = refer('State<$_className>')
      
      ..fields.addAll(List.generate(noFieldsFormItems.length, (index) {
        print('${noFieldsFormItems.elementAt(index).type.toString()} - ${noFieldsFormItems.elementAt(index).name}');
        String? controllerType; 
        /// TODO: make custom default assignments, for example a default counter starting number can be 4 not 0
        String? controllerAssignment;

        /// Selects type of controller for each field
        switch(noFieldsFormItems.elementAt(index).type) {
            case ScoutingGenerationItemTypes.ScoutingShotCounter:
              controllerType = 'ValueNotifier<int>';
              controllerAssignment = '(0)';
              break;
            case ScoutingGenerationItemTypes.ScoutingDropdownButtonFormField:
              controllerType = 'ValueNotifier<String>';
              controllerAssignment = "('')";
              break;
            case ScoutingGenerationItemTypes.ScoutingTextFormField:
              controllerType = 'TextEditingController';
              controllerAssignment = '()';
              break;
            case ScoutingGenerationItemTypes.ScoutingCheckbox:
              controllerType = 'ValueNotifier<bool>';
              controllerAssignment = '(false)';
              break;
            case ScoutingGenerationItemTypes.ScoutingButtonTimer:
              controllerType = 'ValueNotifier<double>';
              controllerAssignment = '(0)';
              break;
            default:
              throw Exception('Cant build for type ${(formItems.elementAt(index).type)}');
          }

        /// Build field
        return Field(((f) => f
          ..name = '_${noFieldsFormItems.elementAt(index).name}Controller'
          ..modifier = FieldModifier.final$
          ..type = Reference(controllerType)
          ..assignment = Code('$controllerType$controllerAssignment')          
        ));
      }))

      /// initState method
      ..methods.addAll([
        Method.returnsVoid((m) => m
          ..name = 'initState'
          ..annotations.add(refer('override'))
          ..body = const Code('super.initState();')),

        /// dispose method
        Method.returnsVoid((m) => m
          ..name = 'dispose'
          ..annotations.add(refer('override'))
          ..body = Code(formItemControllersDispose) 
        ),

        /// Build method
        Method((m) => m
          ..name = 'build'
          ..annotations.add(refer('override'))
          ..returns = Reference('Widget')
          ..requiredParameters.add(
            Parameter((p) => p
              ..name = 'context'
              ..type = Reference('BuildContext')
            )
          )

          ..body = Code(bodyBuilder(noFieldsFormItems))
        )
      ])
    );

    return DartFormatter().format('${state.accept(_emitter)}');
  }
}