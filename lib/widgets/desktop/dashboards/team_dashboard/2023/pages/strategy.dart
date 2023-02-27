import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_no_data_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_text_card.dart';


/// The strategy page in [Dashboard], shows strategy data.
class StrategyDashboardDesktop2023 extends DashboardPage {
  StrategyDashboardDesktop2023({
    Map<String, dynamic Function()>? data,
    String? title,
    String? teamId,
  }) : super(
    title: title ?? 'STRATEGY',
    data: data ?? {
      'strategyTables' : [GetStrategyData.ofTeam, teamId],
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
    
    /// If there is no data, return [DashboardNoDataPage].
    if (data['strategyTables'].isEmpty) {
      return const DashboardNoDataPage();
    }

    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: STRATEGY_CATEGORIES2023.length + 1,
        childAspectRatio: 1.5,
      ),
      children: 
      /// First row contains the titles of the categories.
      <Widget>[
        SizedBox(
          width: width / STRATEGY_CATEGORIES2023.length + 1,
        )
      ]  + List.generate(STRATEGY_CATEGORIES2023.length, (index) => 
        Center(
          child: Text(
            STRATEGY_CATEGORIES2023[index],
            style: Theme.of(context).textTheme.headline1,
          ),
        )
      ) 
      /// The rest of the rows contain the data.
      + List.generate(data['matches'].length, (index) => 
        List.generate(STRATEGY_CATEGORIES2023.length + 1, (index2) => 
          index2 == 0 ? 
          Center(
            child: Text(
              data['matches'][index]['matchNumber'],
              style: Theme.of(context).textTheme.headline2,
            ),
          ) :
          DashboardTextCard(
            text: data['strategyTables'][0][
              STRATEGY_CATEGORIES2023[index2 - 1].replaceAll(' ', '')
              .replaceFirst(
                STRATEGY_CATEGORIES2023[index2 - 1][0],
                STRATEGY_CATEGORIES2023[index2 - 1][0].toLowerCase())] 
                ?? 'no information',
            width: width / STRATEGY_CATEGORIES2023.length + 1,
          )
        )
      ).expand((element) => element).toList(),
    );
  }
}
