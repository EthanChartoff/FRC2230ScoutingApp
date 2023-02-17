import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/new_strategy_data_table2023.dart';
import 'package:scoute_prime/misc/constants.dart';

import 'package:scoute_prime/widgets/matches/scouting_forms/strategy/items/expandable_textfield.dart';


class StrategyForm extends StatefulWidget {
  const StrategyForm({
    required this.exit,
    required this.matchId,
    required this.teamId,
    required this.alliance,
  });

  final void Function() exit;

  final String matchId;

  final String teamId;

  final String alliance;
  
  @override
  State<StatefulWidget> createState() => _StrategyFormState();
}

class _StrategyFormState extends State<StrategyForm>{

  @override
  Widget build(BuildContext context) {    
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: GetStrategyData.ofTeam('2230'),
        builder: ((context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            List<StrategyExpandableTextField> cards = 
              List.generate(
                // the first 5 keys are
                // id, lastChangedAt, matchId, teamId, alliance.
                StrategyCategories2023.length,
                (index) => StrategyExpandableTextField(
                  title: StrategyCategories2023[index],
                  hint: StrategyCategories2023[index],
                )
              );
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => InsertStrategyDataTable2023.newTable(
                      matchId: widget.matchId, 
                      teamId: widget.teamId, 
                      alliance: widget.alliance, 
                      gathering: cards[0].controller.text, 
                      cargo: cards[1].controller.text, 
                      scoring: cards[2].controller.text, 
                      defenceOnOtherRobots: cards[3].controller.text, 
                      defenceOnThemselves: cards[4].controller.text, 
                      drivers: cards[5].controller.text, 
                      comments: cards[6].controller.text
                    ),
                    child: null,
                  )
                ] + cards
              ),
            );
          }
          else {
            return const CircularProgressIndicator();
          }
        }), 
      ),
    );

  }

}