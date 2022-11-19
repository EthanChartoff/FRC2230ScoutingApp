import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart' show ScoutingForm;


/// A timed button for [ScoutingForm]
/// 
/// TODO: implement getter, make [onChanged] non-required
/// and implement different styles

class ScoutingButtonTimer extends StatelessWidget {

  final Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onLongPressDown: (details) => _stopwatch.start(),
      onLongPressUp:() {
        _stopwatch.stop();
        print(_stopwatch.elapsedMilliseconds / 100);
        _stopwatch.reset();
      },

      child: Container(
        height: 100,
        width: 100,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

}