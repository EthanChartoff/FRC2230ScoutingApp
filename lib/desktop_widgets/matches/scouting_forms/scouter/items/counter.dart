import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;




/// A counter designed for [ScoutingForm].
/// 
/// TODO: implement different styles
class ScoutingShotCounter extends StatefulWidget {

  /// Starts from a given value and counts the number of increments/decrements.
  /// 
  /// Can't go below [maxScore] and above [minScore]
  final ValueNotifier<int> counter;

  /// [ScoutingShotCounter]'s score will always be below 
  final int maxScore;

  /// [ScoutingShotCounter]'s score will always be above
  final int minScore;

  /// title above counter
  final String? title;

  const ScoutingShotCounter({
    super.key,
    required this.counter,
    this.maxScore = 999,
    this.minScore = 0,
    this.title
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
        if(widget.counter.value < widget.maxScore) widget.counter.value++;
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
        if(widget.counter.value > widget.minScore) widget.counter.value--;
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
    Text(widget.counter.value.toString()),

    _decrementBtton    
  ];

  get _counterWithTitle {
    List<Widget> counterWithTitle = [Text(widget.title.toString())];
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