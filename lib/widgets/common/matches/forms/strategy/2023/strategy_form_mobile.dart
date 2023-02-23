import 'package:flutter/material.dart';


class StrategyFormMobile extends StatefulWidget {
  const StrategyFormMobile({
    required this.exit,
    required this.matchId,
    required this.teamId,
    required this.alliance,
    required this.matchNum,
  });

  final void Function() exit;

  final String matchId;
  final String teamId;
  final String alliance;
  final String matchNum;
  
  @override
  State<StatefulWidget> createState() => _StrategyFormDesktopState();
}

class _StrategyFormDesktopState extends State<StrategyFormMobile> {
  
}