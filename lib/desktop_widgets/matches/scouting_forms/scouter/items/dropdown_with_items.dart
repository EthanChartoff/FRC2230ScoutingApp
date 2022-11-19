import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;




/// A [DropdownButtonFormField] for [ScoutingForm].
/// 
/// TODO: implement getter, make [onChanged] non-required
/// and implement different styles
class ScoutingDropdownButtonFormField extends DropdownButtonFormField<String> { 


  ScoutingDropdownButtonFormField({
    super.key,
    required items,
    required void Function(String?) onChanged,
    super.dropdownColor
  }) : super(
    items: items,
    onChanged: onChanged,
  );
}