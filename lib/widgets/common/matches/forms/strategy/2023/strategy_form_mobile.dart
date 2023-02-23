import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/expandable_textfield.dart';


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

  List<StrategyExpandableTextField> cards = List.generate(
    STRATEGY_CATEGORIES2023.length,
    (index) => StrategyExpandableTextField(
      title: STRATEGY_CATEGORIES2023[index],
    )
  );

  Future<List> get strategyDataByRound async {
    final strategy = await GetStrategyData.ofTeam(widget.teamId); 
    final matches = await GetMatches.ofTeam(widget.teamId);

    return strategy.map((e) {
      final matchOfStrategyData = 
        matches.firstWhere((match) => match['id'] == e['matchId']);

      return {
        'round': matchOfStrategyData['matchNumber'],
        'strategy': e,
      };      
    }).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: strategyDataByRound,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: cards
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}