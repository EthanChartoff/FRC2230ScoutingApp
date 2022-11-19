import 'package:flutter/material.dart' show Checkbox;

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;


/// A [Checkbox] designed for a [ScoutingForm].
/// 
/// TODO: implement a getter for [value], make [value] and [onChanged] non-required
/// and implement defferent styles and constructors
class ScoutingCheckbox extends Checkbox {
  const ScoutingCheckbox({
    super.key,
    required value,
    required onChanged,
  }) : super(
    value: value,
    onChanged: onChanged
  );
}