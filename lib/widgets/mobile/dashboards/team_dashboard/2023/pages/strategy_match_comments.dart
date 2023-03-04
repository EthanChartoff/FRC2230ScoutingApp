import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/no_match_strategy.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/dashboard/2023/dashboard_funcs2023.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';

class StrategyDashboardMobile2023 extends DashboardPage {
  StrategyDashboardMobile2023({
    Map<String, dynamic Function()>? data,
    String? title,
    String? teamId,
  }) : super(
    title: title ?? 'STRATEGY',
    data: data ?? {
      'strategyTables' : [GetStrategyData.ofTeam, teamId],
      'noMatchesStrategyTables' : [GetNoMatchStrategyData.ofTeam, teamId],
      'matches' : [GetMatches.ofTeam, teamId],
    }
  );

  @override
  Widget buildDashboard({
    required BuildContext context, 
    required Map<String, dynamic> data, 
    required double width, 
    Key? key
  }) {

    final strategyByRound = DashboardFuncs2023.strategyDataByRound(
      data['strategyTables'],
      data['matches']
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height - 150,
      child: Column(
        children: List.generate(data['strategyTables'].length, (index) => 
          InkWell(
            onLongPress: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).primaryColorDark,
                title: Text(
                  strategyByRound[index]['round'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  )
                ),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: List.generate(DB_ACCURATE_STRATEGY_CATEGORIES2023.length, (index2) => 
                      Row(
                        children: [
                          Text(
                            '${STRATEGY_CATEGORIES2023[index2]}: ',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            strategyByRound[index]['strategy'][DB_ACCURATE_STRATEGY_CATEGORIES2023[index2]].toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      )
                    )
                  ),
                )
              )
            ),
            child: Column(
              children: [
                Text(
                  strategyByRound[index]['round'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  )
                ),
                
                ...List.generate(DB_ACCURATE_STRATEGY_CATEGORIES2023.length, (index2) => 
                  Row(
                    children: [
                      Text(
                        '${STRATEGY_CATEGORIES2023[index2]}: ',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      Flexible(
                        child: Text(
                          strategyByRound[index]['strategy'][DB_ACCURATE_STRATEGY_CATEGORIES2023[index2]].toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
