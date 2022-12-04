import 'dart:io';

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
  final ValueNotifier<int> _shotCounterController = ValueNotifier<int>(0);

  final ValueNotifier<String> _dropdownButtonController =
      ValueNotifier<String>('');

  final TextEditingController _textfieldController = TextEditingController();

  final ValueNotifier<bool> _checkboxController = ValueNotifier<bool>(false);

  final ValueNotifier<double> _buttonTimerController = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _shotCounterController.dispose();
    _dropdownButtonController.dispose();
    _textfieldController.dispose();
    _checkboxController.dispose();
    _buttonTimerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          ScoutingShotCounter(
            controller: _shotCounterController,
          ),
        
          ScoutingDropdownButtonFormField(
            items: const [
              DropdownMenuItem(value: '1', child: Text('comp 1')),
              DropdownMenuItem(value: '2', child: Text('comp 2')),
              DropdownMenuItem(value: '3', child: Text('comp 3')),
              DropdownMenuItem(value: '4', child: Text('comp 4')),
              DropdownMenuItem(value: '5', child: Text('comp 5')),
            ],
            controller: _dropdownButtonController,
          ),
        
          ScoutingTextFormField(
            controller: _textfieldController,
            onChanged: (value) => setState(() {}),
            hint: 'input something',
            labelText: 'idk',
          ),
        
          ScoutingCheckbox(
            controller: _checkboxController,
            value: _checkboxController.value,
            onChanged: (value) => setState(() {
              _checkboxController.value = value;
            })
          ),
        
          ScoutingButtonTimer(
            controller: _buttonTimerController,
          ),
        
          ElevatedButton(
            onPressed: widget.exit,
            child: null
          ),
      
          // ElevatedButton(
          //   onPressed: (() => InsertScoutingDataTable.newTable(
          //     shotCounter: _shotCounterController,
          //     dropdownButton: _dropdownButtonController,
          //     textfield: _textfieldController,
          //     checkbox: _checkboxController,
          //     buttonTimer: _buttonTimerController,
          //   )),
          //   child: null
          // )
        ],
      ),
    );
  }
}