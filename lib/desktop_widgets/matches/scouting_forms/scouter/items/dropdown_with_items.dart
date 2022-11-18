import 'package:flutter/material.dart';


/// TODO
class ScoutingDropdownButtonFormField extends DropdownButtonFormField<String> { 

  BuildContext context; 

  ScoutingDropdownButtonFormField({
    super.key,
    required this.context,
    required items,
    required void Function(String?) onChanged,
    dropdownColor
  }) : super(
    items: items,
    onChanged: onChanged,
    dropdownColor: Theme.of(context).primaryColorDark
  );

  static Widget withTheme({
    required ScoutingDropdownButtonFormField scoutingDropdownButtonFormField
  }) {
    return Theme(
      data: ThemeData(
        hoverColor: Colors.amber
      ), 
      child: scoutingDropdownButtonFormField
    );
  }

}