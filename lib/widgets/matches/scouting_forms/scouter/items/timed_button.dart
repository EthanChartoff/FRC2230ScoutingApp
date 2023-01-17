import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A timed button for [ScoutingForm2022]
/// 
/// TODO: implement different styles

class ScoutingButtonTimer extends StatelessWidget {

  final ValueNotifier<double> controller;

  ScoutingButtonTimer({
    required this.controller
  });

  final Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPressDown: (details) => _stopwatch.start(),
      onLongPressUp:() {
        _stopwatch.stop();
        controller.value = _stopwatch.elapsedMilliseconds / 100;
        _stopwatch.reset();
      },

      child: Container(
        height: 100,
        width: 100,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }

}