import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/scouter/scouting_form2022.dart' show ScoutingForm2022;


/// A timed button for [ScoutingForm2022]
/// 
/// TODO: implement different styles

class ScoutingButtonTimer extends StatefulWidget {

  final ValueNotifier<double> controller;

  final String? title;

  const ScoutingButtonTimer({
    required this.controller,
    this.title,
  });

  @override
  State<ScoutingButtonTimer> createState() => _ScoutingButtonTimerState();
}

class _ScoutingButtonTimerState extends State<ScoutingButtonTimer> {
  final Stopwatch _stopwatch = Stopwatch();

  @override
  Widget build(BuildContext context) {    
    return Column(
      children: [
        Text(
          widget.title ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),

        GestureDetector(
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
            margin: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            color: Theme.of(context).primaryColorDark,
            child: Center(
              child: StreamBuilder(
                stream: Stream.periodic(const Duration(milliseconds: 10)),
                builder: (context, snapshot) {
                  if(_stopwatch.isRunning) {
                    return Text(
                      '${_stopwatch.elapsedMilliseconds / 1000}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  } 
                  else {
                    return Text(
                      '${widget.controller.value}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}