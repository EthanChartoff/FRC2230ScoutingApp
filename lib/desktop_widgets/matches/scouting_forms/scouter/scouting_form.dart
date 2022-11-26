import 'package:flutter/material.dart';

import 'package:scoute_prime/api/dart/insert/new_scouting_data_table.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/timed_button.dart';


/// The Scouting form, where scouters pass data to the databse.
/// 
/// THIS IS ONLY FOR DEBUGING AND IS NOT THE INTENDED PRODUCT
class ScoutingForm extends StatefulWidget {

  final void Function() exit;

  const ScoutingForm({
    required this.exit
  });

  @override
  State<StatefulWidget> createState() => _ScoutingFormState();
}

class _ScoutingFormState extends State<ScoutingForm>{
  bool z = true;
  String x = 'lol';
  int y = 0;

  final TextEditingController _controller = TextEditingController();
  final ValueNotifier<int> _counterController = ValueNotifier<int>(0);
  final ValueNotifier<String> _dropdownController = ValueNotifier<String>('');
  final ValueNotifier<bool> _checkboxController = ValueNotifier<bool>(false);
  final ValueNotifier<double> _timedbuttonController = ValueNotifier<double>(0);



  void paramEquelGivenVal(String? value) {
    setState(() {
      x = value!;
    });
  }

  void _counterFunc(int value) {
    setState(() {
      y = value;
    });
  }

  void _boolFunc(bool? value) {
    setState(() {
      z = value!;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _counterController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final i = ScoutingShotCounter(
      counter: _counterController,
    );
    
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [

          Text(_dropdownController.value.toString()),

          i,

          ScoutingDropdownButtonFormField(
            items: const [
              DropdownMenuItem(value: 'comp 1', child: Text('comp 1')),
              DropdownMenuItem(value: 'comp 2', child: Text('comp 2')),
            ], 
            controller: _dropdownController,
            dropdownColor: Colors.pink,
          ),
          
          ScoutingTextFormField(
            controller: _controller,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),

          ScoutingCheckbox(
            controller: _checkboxController,
          ),

          ScoutingButtonTimer(
            controller: _timedbuttonController,
          ),
    
          ElevatedButton(
            onPressed: () => setState(() {}),
            child: null
          ),

          ElevatedButton(
            onPressed: (() => InsertScoutingDataTable.newTable(
              matchId: 4,
              teamId: 2230,
              didWin: 1,
              alliance: 'blue',
              startingPos: 1,
              wasRobotOnField: 0,
              didRobotWorkInAuto: 0,
              didRobotWorkInTP: 0, 
              didDefend: 0, 
              wasStrategyDifferent: 0, 
              defenseComments: 'defence',
              robotComments: "",
              strategyComments: "",
              scouterName: "dasd"
            )), 
            child: null
          )
        ],
      ),
    );
  }
}