import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;




/// A [DropdownButtonFormField] for [ScoutingForm].
/// 
/// TODO: implement different styles
class ScoutingDropdownButtonFormField extends DropdownButtonFormField<String> { 

  /// Controller from parent widget, changes to select value when chosen
  final ValueNotifier<String> controller;

  ScoutingDropdownButtonFormField({
    super.key,
    required List<DropdownMenuItem<String>>? items,
    required this.controller,
    super.dropdownColor
  }) : super(
    items: items,
    onChanged: (String? value) {
      if(value is String) {
        controller.value = value;
      }
    }
  );
}