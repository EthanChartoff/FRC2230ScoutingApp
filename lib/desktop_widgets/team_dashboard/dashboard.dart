import 'package:flutter/material.dart';

class TeamDashboard extends StatefulWidget {
  /// 
  String teamNumber;

  TeamDashboard({
    required this.teamNumber
  });
  
  @override
  State<StatefulWidget> createState() => _TeamDashboardState();
}

class _TeamDashboardState extends State<TeamDashboard>{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Text(
          widget.teamNumber,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

}