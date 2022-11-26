import 'package:flutter/material.dart' show Checkbox, ValueNotifier;

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;


/// A [Checkbox] designed for a [ScoutingForm].
/// 
/// TODO: implement defferent styles and constructors
class ScoutingCheckbox extends Checkbox {

  final ValueNotifier<bool> controller; 

  ScoutingCheckbox({
    super.key,
    required this.controller,
    bool? value,
    void Function(dynamic)? onChanged
  }) : super(
    value: value ?? false,
    onChanged: (bool? value) {
      if(value is bool) {
        controller.value = value;
      }
    } 
  );
}