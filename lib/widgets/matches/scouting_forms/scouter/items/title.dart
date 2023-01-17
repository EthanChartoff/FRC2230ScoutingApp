import 'package:flutter/material.dart';


/// A title for a scouting form.
class ScoutingTitle extends StatelessWidget {
  final String title;

  const ScoutingTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 40
            ),
          ),
        ),
      )
    );
  }
}