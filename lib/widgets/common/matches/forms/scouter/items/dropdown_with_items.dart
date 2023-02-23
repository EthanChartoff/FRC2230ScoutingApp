import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/constants.dart';

import 'package:scoute_prime/widgets/common/matches/forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A [DropdownButtonFormField] for [ScoutingForm2022].
/// 
/// TODO: implement different styles, change hover color
class ScoutingDropdownButtonFormField<T> extends StatelessWidget {
  ScoutingDropdownButtonFormField({
    super.key,
    required this.items,
    required this.controller,
    this.dropdownColor = ConstColors.PRIMARY_COLOR_DARK,
    Color? hoverColor,
    this.hint,
    this.onChanged,
    this.decoration,
    this.style,
  }) : 
  hoverColor = hoverColor ?? ConstColors.PRIMARY_COLOR.withOpacity(0.2);


  /// Dropdown items
  final List<DropdownMenuItem<T>> items;

  /// Controller from parent widget, changes to select value when chosen
  final ValueNotifier<T> controller;

  final Color dropdownColor;
  final Color hoverColor;

  final String? hint;
  final void Function(T?)? onChanged;
  final InputDecoration? decoration;
  final TextStyle? style;
  

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Theme.of(context).hoverColor.withOpacity(0.1),
      ),
      child: DropdownButtonFormField<T>(
        key: key,
        items: items,
        onChanged: onChanged ?? (value) {
          if(value != null) {
            controller.value = value;
          }
        },
        focusColor: Colors.transparent,
        hint: hint != null ? Text(
          controller.value.toString() != '' ? 
          '$hint: ${controller.value} lol' : 
          '$hint',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          )
        ) : null,
        dropdownColor: dropdownColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 40,
              style: BorderStyle.solid,
            )
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}