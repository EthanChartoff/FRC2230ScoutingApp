import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/new_strategy_data_table2023.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/snackbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/expandable_textfield.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/side_comments.dart';


class StrategyFormDesktop extends StatefulWidget {
  const StrategyFormDesktop({
    required this.relatedToMatch,
    required this.exit,
    required this.teamId,

    this.matchId,
    this.alliance,
    this.matchNum,
  }) :
  assert(!relatedToMatch || !(matchId == null || alliance == null || matchNum == null)  ,'when relatedToMatch is true, matchId, alliance and matchNum must not be null');


  final bool relatedToMatch;
  final void Function() exit;
  final String teamId;

  final String? matchId;
  final String? alliance;
  final String? matchNum;
  
  @override
  State<StatefulWidget> createState() => _StrategyFormDesktopState();
}

class _StrategyFormDesktopState extends State<StrategyFormDesktop> {

  List<StrategyExpandableTextField> cards = List.generate(
    STRATEGY_CATEGORIES2023.length,
    (index) => StrategyExpandableTextField(
      title: STRATEGY_CATEGORIES2023[index],
    )
  );

  late final List<TextEditingController> controllers;

  List<String> controllersTexts = List.generate(
    STRATEGY_CATEGORIES2023.length,
    (index) => '',
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

  /// using the controllers text to send can cause errors, its better to do it 
  /// this way. 
  void onTextFieldChanged(String text, int index) {
    setState(() {
      controllersTexts[index] = text;
    });
  }

  @override
  void initState() {
    super.initState();
    controllers = List.generate(cards.length, (index) => 
      TextEditingController()
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
   
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: strategyDataByRound,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 472,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 400,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if(widget.relatedToMatch) {
                                InsertStrategyDataTable2023.newTable(
                                matchId: widget.matchId, 
                                teamId: widget.teamId, 
                                alliance: widget.alliance, 
                                gathering: controllersTexts[0], 
                                cargo: controllersTexts[1], 
                                scoring: controllersTexts[2], 
                                defenceOnOtherRobots: controllersTexts[3], 
                                defenceOnThemselves: controllersTexts[4], 
                                drivers: controllersTexts[5], 
                                comments: controllersTexts[6],
                                auto: controllersTexts[7],
                                chargeStation: controllersTexts[8]
                              );
                            } else {
                              InsertStrategyDataTable2023.newTableNoMatch(
                                teamId: widget.teamId, 
                                gathering: controllersTexts[0], 
                                cargo: controllersTexts[1], 
                                scoring: controllersTexts[2], 
                                defenceOnOtherRobots: controllersTexts[3], 
                                defenceOnThemselves: controllersTexts[4], 
                                drivers: controllersTexts[5], 
                                comments: controllersTexts[6],
                                auto: controllersTexts[7],
                                chargeStation: controllersTexts[8]
                              );
                            }

                              ScaffoldMessenger.of(context).showSnackBar(
                                ScoutingSnackbar(
                                  message: AppLocalizations.of(context)
                                    .dataSavedMsg,
                                )
                              );

                              widget.exit();
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Text(
                              AppLocalizations.of(context).saveButton,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 66,
                        child: ListView(
                          children: cards.map<StrategyExpandableTextField>((e) => 
                            StrategyExpandableTextField(
                              title: AppLocalizations.of(context)
                                .getStrategyCategotyName(e.title),
                              controller: e.controller,
                              isExpanded: e.isExpanded,
                              onExpand: () => setState(() {}),
                            )
                          ).toList(),
                        ),
                      )
                    ]
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                  width: 400,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => StrategySideComment(
                      roundData: snapshot.data![index],
                      showCategory: cards.asMap().map(
                        (key, value) => MapEntry(
                          DB_ACCURATE_STRATEGY_CATEGORIES2023[cards.indexOf(value)], 
                          value.isExpandedValue
                        )
                      )
                    )
                  ), 
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      )
    );
  }
}