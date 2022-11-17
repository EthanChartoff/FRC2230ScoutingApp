import 'package:flutter/material.dart';


/// TODO
class ScoutingButtonTimer extends StatelessWidget {

  final Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _stopwatch.start(),
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