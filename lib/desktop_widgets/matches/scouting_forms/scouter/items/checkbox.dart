import 'package:flutter/material.dart' show 
  Checkbox, ValueNotifier, Text, CheckboxListTile;

import 'package:flutter/src/widgets/framework.dart';


/// A [Checkbox] designed for a [ScoutingForm].
/// 
/// TODO: implement defferent styles and constructors
class ScoutingCheckbox extends CheckboxListTile {

  final ValueNotifier<bool> controller; 

  ScoutingCheckbox({
    super.key,
    required this.controller,
    required onChanged,
    String title = '',
  }) : super(
    value: controller.value,
    onChanged: onChanged,
    title: Text(title)
  );
  
}