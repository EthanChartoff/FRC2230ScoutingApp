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

  int _counter = 0;

  IconButton get _incrementButton => IconButton(
    onPressed: () {
      setState(() {
        if(_counter < widget.maxScore) _counter++;
      });
      widget.onChange(_counter);
    }, 
    icon: const Icon(
      Icons.keyboard_arrow_up, 
      color: Colors.lightGreen
    )
  );

  IconButton get _decrementBtton => IconButton(
    onPressed: () {
      setState(() {
        if(_counter > widget.minScore) _counter--;
      });
      widget.onChange(_counter);
    }, 
    icon: const Icon(
      Icons.keyboard_arrow_down, 
      color: Colors.red
    )
  );



  List<Widget> get _counterWithoutTitle => <Widget>[
    _incrementButton,

    /// Counter counting numbers
    Text(_counter.toString()),

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