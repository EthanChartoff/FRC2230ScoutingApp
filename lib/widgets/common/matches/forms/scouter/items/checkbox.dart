import 'package:flutter/material.dart' show BuildContext, Checkbox, CheckboxListTile, Colors, StatelessWidget, Text, TextStyle, Theme, ValueNotifier, Widget;


/// A [Checkbox] designed for a [ScoutingForm].
/// 
/// TODO: implement defferent styles and constructors
class ScoutingCheckbox extends StatelessWidget {

  ScoutingCheckbox({
    super.key,
    required this.controller,
    this.onChanged,
    String? title,
  }) :
    title = title != null ? 
    Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ) : null;


  final ValueNotifier<bool> controller; 

  final void Function(bool?)? onChanged;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        hoverColor: Theme.of(context).hoverColor.withOpacity(0.1),
      ),
      child: CheckboxListTile(
        key: key,
        value: controller.value,
        onChanged: onChanged,
        title: title,
      ),
    );
  }
  
}