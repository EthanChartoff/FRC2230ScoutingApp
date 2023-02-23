import 'package:flutter/material.dart' show TextFormField, InputDecoration;

import 'package:scoute_prime/widgets/common/matches/forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A [TextFormField] for [ScoutingForm2022]
/// 
/// TODO: implement different styles

class ScoutingTextFormField extends TextFormField {

  final String? labelText;

  final String? errorText;

  final String? hint;

  final bool canBeEmpty;

  ScoutingTextFormField({
    super.key,
    required controller,
    super.initialValue,
    super.focusNode,
    super.onChanged,
    super.keyboardType,
    super.inputFormatters,
    super.maxLines,
    super.minLines,
    super.maxLength,
    decoration,
    this.labelText,
    this.errorText,
    this.hint,
    this.canBeEmpty = false
  }) : 
  assert(controller != null, "controller can't be null"),
  assert(
    (maxLines == null) || (minLines == null) || (maxLines >= minLines),
    "minLines can't be greater than maxLines",
  ),
  assert(maxLines == null || maxLines > 0, "maxLines can't be negative"),
  assert(minLines == null || minLines > 0, "minLines can't be negative"),
  super(
    controller: controller,
    decoration: decoration ?? InputDecoration(
      labelText: labelText,
      errorText: canBeEmpty ? null : controller.text.isEmpty ? errorText ?? "Can't be empty" : null,
      hintText: hint
    )
  );
}