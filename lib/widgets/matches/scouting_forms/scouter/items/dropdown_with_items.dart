import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/constants.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A [DropdownButtonFormField] for [ScoutingForm2022].
/// 
/// TODO: implement different styles
class ScoutingDropdownButtonFormField extends DropdownButtonFormField<String> { 

  /// Controller from parent widget, changes to select value when chosen
  final ValueNotifier<String> controller;

  ScoutingDropdownButtonFormField({
    super.key,
    required List<DropdownMenuItem<String>>? items,
    required this.controller,
    super.dropdownColor,
    String? hint,
  }) : super(
    items: items,
    onChanged: (String? value) {
      if(value is String) {
        controller.value = value;
      }
    },
    hint: hint != null ? Text(
      hint,
      style: const TextStyle(
        color: ConstColors.SECONDARY_COLOR,
      )
    ) : null,
    decoration: const InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 40,
          style: BorderStyle.solid,
        )
      ),
    ),
    style: const TextStyle(
      color: ConstColors.SECONDARY_COLOR,
    ),
  );
}