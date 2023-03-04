import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/no_match_strategy.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';

class StrategyNoMatchDashboardMobile2023 extends DashboardPage {
  StrategyNoMatchDashboardMobile2023({
    Map<String, dynamic Function()>? data,
    String? title,
    String? teamId,
  }) : super(
    title: title ?? 'STRATEGY',
    data: data ?? {
      'noMatchesStrategyTables' : [GetNoMatchStrategyData.ofTeam, teamId],
    }
  );
  
  @override
  Widget buildDashboard({
    required BuildContext context, 
    required Map<String, dynamic> data, 
    required double width, 
    Key? key
  }) {
    return SizedBox(
      width: width / 2 - 1,
      child: Column(
        children: List.generate(data['noMatchesStrategyTables'].length, (index) =>
          InkWell(
            onLongPress: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
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
                            ),
                          ),
                          Expanded(
                            child: Text(
                              data['noMatchesStrategyTables'][index][DB_ACCURATE_STRATEGY_CATEGORIES2023[index2]].toString(),
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          )
                        ],
                      )
                    )
                  ),
                )
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: 
                  List.generate(DB_ACCURATE_STRATEGY_CATEGORIES2023.length, (index2) => 
                    Row(
                      children: [
                        Text('${STRATEGY_CATEGORIES2023[index2]}: '),
                        Flexible(
                          child: Text(
                            data['noMatchesStrategyTables'][index][DB_ACCURATE_STRATEGY_CATEGORIES2023[index2]].toString(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  )
              ),
            ),
          )
        ),
      ),
    );
  }

}




