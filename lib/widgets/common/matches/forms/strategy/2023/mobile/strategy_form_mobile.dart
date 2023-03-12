import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/no_match_strategy.dart';
import 'package:scoute_prime/api/2230_database/dart/insert/new_strategy_data_table2023.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/items/snackbar.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/expandable_textfield.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/no_match_side_comments.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/items/side_comments.dart';


class StrategyFormMobile extends StatefulWidget {
  const StrategyFormMobile({
    required this.relatedToMatch,
    required this.exit,
    required this.teamId,

    this.matchId,
    this.alliance,
    this.matchNum,
  }) : 
  assert(!relatedToMatch || 
        !(matchId == null || alliance == null || matchNum == null),
        'when relatedToMatch is true, matchId, alliance and matchNum must not be null');

  final bool relatedToMatch;
  final void Function() exit;
  final String teamId;

  final String? matchId;
  final String? alliance;
  final String? matchNum;
  
  @override
  State<StatefulWidget> createState() => _StrategyFormDesktopState();
}

class _StrategyFormDesktopState extends State<StrategyFormMobile> {

  List<StrategyExpandableTextField> cards = List.generate(
    STRATEGY_CATEGORIES2023.length,
    (index) => StrategyExpandableTextField(
      title: DB_ACCURATE_STRATEGY_CATEGORIES2023[index],
      isExpanded: ValueNotifier<bool>(false),
    )
  );

  late final List<TextEditingController> controllers;

  List<String> controllersTexts = List.generate(
    STRATEGY_CATEGORIES2023.length,
    (index) => '',
  );

  Future<Map> get getData async {
    final strategy = await GetStrategyData.ofTeam(widget.teamId);
    final strategyNoMatches = await GetNoMatchStrategyData.ofTeam(widget.teamId); 
    final matches = await GetMatches.ofTeam(widget.teamId);

    final strategyByRound = strategy.map((e) {
      final matchOfStrategyData = 
        matches.firstWhere((match) => match['id'] == e['matchId']);

      return {
        'round': matchOfStrategyData['matchNumber'],
        'strategy': e,
      };      
    }).toList();

    return {
      'strategyByRound': strategyByRound,
      'noMatchStrategy': strategyNoMatches,
    };
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
        future: getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            AppLocalizations.of(context)
                              .saveButton,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: cards.map((e) => 
                          StrategyExpandableTextField(
                            title: AppLocalizations.of(context)
                              .getStrategyCategotyName(e.title),
                            controller: controllers[cards.indexOf(e)],
                            onChanged: (text) => 
                              onTextFieldChanged(text, cards.indexOf(e)),
                            isExpanded: e.isExpanded,
                            onExpand: () => setState(() {
                              
                            }),
                          )
                        ).toList()
                      ),
                    ),
                  ],
                ),
                /// TODO: add also non related strategy to match strategy data
                
                snapshot.data!['strategyByRound'].isNotEmpty ? 
                ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => StrategySideComment(
                    roundData: snapshot.data!['strategyByRound'][index], 
                    showCategory: cards.asMap().map((key, value) => MapEntry(
                      DB_ACCURATE_STRATEGY_CATEGORIES2023
                        [cards.indexOf(value)],
                      value.isExpandedValue,
                    )),
                  ),
                ) : const Center(
                  child: Text(
                    'No data',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                NoMatchSideComments(
                  data: snapshot.data!['noMatchStrategy'],
                  showCategory: cards.asMap().map((key, value) => MapEntry(
                    DB_ACCURATE_STRATEGY_CATEGORIES2023
                      [cards.indexOf(value)],
                    value.isExpandedValue,
                  )),
                ) 
              ],
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