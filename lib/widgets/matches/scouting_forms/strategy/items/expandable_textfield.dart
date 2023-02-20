import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/// Text field for strategy form. 
class StrategyExpandableTextField extends StatefulWidget {

  StrategyExpandableTextField({
    required this.title,
    this.hint,
    this.onChanged,
    TextEditingController? controller,
    ValueNotifier? isExpanded,
  }) : 
  controller = controller ?? TextEditingController(),
  isExpanded = isExpanded ?? ValueNotifier(false);


  final String title;

  /// Should display the last value of type of scouting data entered.
  /// 
  /// For example, if at round 1 strategy typed 'robot can climb' at round 2 the 
  /// same card will have a hint 'robot can climb'. 
  final String? hint;

  /// Called when the user changes the text in the field.
  final void Function(String)? onChanged;

  /// If the card is expanded or not.
  final ValueNotifier isExpanded;

  final TextEditingController controller;

  @override
  State<StrategyExpandableTextField> createState() => _StrategyExpandableTextFieldState();
}

class _StrategyExpandableTextFieldState extends State<StrategyExpandableTextField> {
  Timer? debounce;

  String? get getControllerText => widget.controller.text;

  @override
  void dispose() {
    widget.controller.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    onSearchChanged(String value) {
      if(debounce?.isActive ?? false) debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 500), () {
        widget.onChanged?.call(value);
      });
    }

    return Card(
      color: Theme.of(context).primaryColorDark,
      child: Theme(
        data: ThemeData(
          hoverColor: null,
        ),
    
        child: ExpansionTile(
          initiallyExpanded: widget.isExpanded.value,
          onExpansionChanged: (value) => widget.isExpanded.value = value,
          title: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
              )
            ),
          ),
    
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.controller,
                onChanged: onSearchChanged,
                minLines: 1,
                maxLines: 50,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                  ),
                  border: const OutlineInputBorder()
                ),
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
} 


class StrategyTextField extends TextField {
  StrategyTextField({
    super.decoration,
    super.style,
    super.onChanged,
    super.controller,
    super.maxLines,
    super.minLines,
  });
}