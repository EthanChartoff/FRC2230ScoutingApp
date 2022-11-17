import 'package:flutter/material.dart' show Checkbox;

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