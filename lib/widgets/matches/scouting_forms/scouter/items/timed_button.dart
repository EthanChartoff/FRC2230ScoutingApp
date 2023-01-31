import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A timed button for [ScoutingForm2022]
/// 
/// TODO: implement different styles

class ScoutingButtonTimer extends StatefulWidget {

  final ValueNotifier<double> controller;

  const ScoutingButtonTimer({
    required this.controller
  });

  @override
  State<ScoutingButtonTimer> createState() => _ScoutingButtonTimerState();
}

class _ScoutingButtonTimerState extends State<ScoutingButtonTimer> {
  final Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {

    // return GestureDetector(
    //   onLongPressDown: (details) => _stopwatch.start(),
    //   onLongPressUp:() {
    //     _stopwatch.stop();
    //     widget.controller.value = _stopwatch.elapsedMilliseconds / 100;
    //     print(widget.controller.value);
    //     _stopwatch.reset();
    //   },
    //   onTapCancel: ,

    //   child: Container(
    //     height: 100,
    //     width: 100,
    //     color: Theme.of(context).primaryColorDark,
    //     child: Center(
    //       child: Text(
    //         '${_stopwatch.elapsedMilliseconds / 100}',
    //         style: const TextStyle(
    //           color: Colors.white,
    //           fontSize: 20,
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    /// a button that starts a stopwatch when pressed and stops it when released
    
    return GestureDetector(
      onTapDown: (details) => _stopwatch.start(),
      onTapUp: (details) {
        _stopwatch.stop();
        setState(() {
          widget.controller.value = _stopwatch.elapsedMilliseconds / 1000;
        });
        _stopwatch.reset();
      },
      onTapCancel: () {
        _stopwatch.stop();
        setState(() {
          widget.controller.value = _stopwatch.elapsedMilliseconds / 1000;
        });
        _stopwatch.reset();
      },
      child: Container(
        height: 100,
        width: 100,
        color: Theme.of(context).primaryColorDark,
        child: Center(
          child: Text(
            '${widget.controller.value}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}