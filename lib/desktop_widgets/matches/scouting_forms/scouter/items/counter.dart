import 'package:flutter/material.dart';

class ScoutingShotCounter extends StatefulWidget {

  final void Function(int) onChange;

  /// Starts from zero and counts the number of increments/decrements.
  /// 
  /// Can't go below [maxScore] and above [minScore]
  // int counter;

  /// [counter]'s score will always be below 
  final int maxScore;

  /// [counter]'s score will always be above
  final int minScore;

  final String? title;

  const ScoutingShotCounter({
    super.key,
    required this.onChange,
    this.maxScore = 999,
    this.minScore = 0,
    this.title
  }); 

  @override
  State<StatefulWidget> createState() => _ScoutingShotCounterState();
}

class _ScoutingShotCounterState extends State<ScoutingShotCounter> {

  int counter = 0;

  List<Widget> get _counterWithoutTitle => <Widget>[
    /// Increment button
    IconButton(
      onPressed: () {
        setState(() {
          if(counter < widget.maxScore) counter++;
        });
        widget.onChange(counter);
      }, 
      icon: const Icon(
        Icons.keyboard_arrow_up, 
        color: Colors.lightGreen
      )
    ),

    /// Counter counting numbers
    Text(counter.toString()),

    /// Decrement button
    IconButton(
      onPressed: () {
        setState(() {
          if(counter > widget.minScore) counter--;
        });
        widget.onChange(counter);
      }, 
      icon: const Icon(
        Icons.keyboard_arrow_down, 
        color: Colors.red
      )
    ),
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