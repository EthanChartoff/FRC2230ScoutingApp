import 'package:flutter/material.dart';
import 'package:scoute_prime/api/dart/insert/new_scouting_data_table.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/checkbox.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/counter.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/dropdown_with_items.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/textfield.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/items/timed_button.dart';


/// TODO
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [

          Text(_controller.text),

          ScoutingDropdownButtonFormField(
            context: context,
            items: const [
              DropdownMenuItem(value: 'comp 1', child: Text('comp 1')),
              DropdownMenuItem(value: 'comp 2', child: Text('comp 2')),
            ], 
            onChanged: paramEquelGivenVal, 
            dropdownColor: Colors.pink,
          ),
          

          ScoutingTextFormField(
            controller: _controller,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),

          ScoutingShotCounter(
            onChange: _counterFunc,
            //counter: widget.y,
            title: 'lol',
          ),

          ScoutingCheckbox(
            value: z,
            onChanged: _boolFunc
          ),

          ScoutingButtonTimer(),
    
          ElevatedButton(
            onPressed: widget.exit,
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