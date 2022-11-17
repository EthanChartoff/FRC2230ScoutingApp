import 'package:flutter/material.dart';


/// TODO
class ScoutingDropdownButtonFormField extends DropdownButtonFormField<String> {  

  ScoutingDropdownButtonFormField({
    super.key,
    required items,
    required void Function(String?) onChanged,
  }) : super(
    items: items,
    onChanged: onChanged
  );

}