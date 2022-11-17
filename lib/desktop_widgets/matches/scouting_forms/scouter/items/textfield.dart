import 'package:flutter/material.dart';


class ScoutingTextFormField extends TextFormField {

  ScoutingTextFormField({
    super.key,
    required controller,
    onChanged,
    keyboardType,
    inputFormatters,
    maxLines,
    minLines,
    maxLength,
    decoration
  }) : super(
    controller: controller,
    onChanged: onChanged,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    maxLines: maxLines,
    minLines: minLines,
    maxLength: maxLength,
    decoration: decoration
  );




}