import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form2022.dart' show ScoutingForm2022;




/// A counter designed for [ScoutingForm2022].
/// 
/// TODO: implement different styles
class ScoutingShotCounter extends StatefulWidget {

  /// Starts from a given value and counts the number of increments/decrements.
  /// 
  /// Can't go below [maxScore] and above [minScore]
  final ValueNotifier<int> controller;

  /// [ScoutingShotCounter]'s score will always be below 
  final int maxScore;

  /// [ScoutingShotCounter]'s score will always be above
  final int minScore;

  /// title above counter
  final String? title;

  final Function()? onChanged;

  const ScoutingShotCounter({
    super.key,
    required this.controller,
    this.maxScore = 999,
    this.minScore = 0,
    this.title,
    this.onChanged
  });  

  @override
  State<StatefulWidget> createState() => _ScoutingShotCounterState();
}

class _ScoutingShotCounterState extends State<ScoutingShotCounter>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  IconButton get _incrementButton => IconButton(
    onPressed: () {
      setState(() {
        if(widget.controller.value < widget.maxScore) widget.controller.value++;
        widget.onChanged != null ? widget.onChanged!() 
          : null;
      });
    },
    
    icon: const Icon(
      Icons.keyboard_arrow_up, 
      color: Colors.lightGreen
    )
  );


  IconButton get _decrementBtton => IconButton(
    onPressed: () {
      setState(() {
        if(widget.controller.value > widget.minScore) widget.controller.value--;
        widget.onChanged != null ? widget.onChanged!() 
          : null;
      });
      //widget.onChanged(_counter);
    }, 
    icon: const Icon(
      Icons.keyboard_arrow_down, 
      color: Colors.red
    )
  );

  List<Widget> get _counterWithoutTitle => <Widget>[
    _incrementButton,

    /// Counter counting numbers
    Text(widget.controller.value.toString()),

    _decrementBtton    
  ];

  get _counterWithTitle {
    List<Widget> counterWithTitle = [Text(widget.title.toString(), 
      style: Theme.of(context).textTheme.subtitle1,
    )];
    counterWithTitle.addAll(_counterWithoutTitle);
    return counterWithTitle;
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: (widget.title != null) ? _counterWithTitle : _counterWithoutTitle,
    );

  }
}