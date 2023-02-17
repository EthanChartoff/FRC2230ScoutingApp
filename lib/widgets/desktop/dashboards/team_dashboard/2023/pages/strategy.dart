import 'package:flutter/material.dart';
import 'package:scoute_prime/api/2230_database/dart/get/get_strategy_table.dart';
import 'package:scoute_prime/api/2230_database/dart/get/gets_match_table.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/dashboard_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/widgets/dashboard_text_card.dart';


/// The strategy page in [Dashboard], shows strategy data.
class StrategyDashboard2023 extends DashboardPage {
  StrategyDashboard2023({
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
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: StrategyCategories2023.length + 1,
        childAspectRatio: 1.5,
      ),
      children: 
      /// First row contains the titles of the categories.
      <Widget>[
        SizedBox(
          width: width / StrategyCategories2023.length + 1,
        )
      ]  + List.generate(StrategyCategories2023.length, (index) => 
        Center(
          child: Text(
            StrategyCategories2023[index],
            style: Theme.of(context).textTheme.headline1,
          ),
        )
      ) 
      /// The rest of the rows contain the data.
      + List.generate(data['matches'].length, (index) => 
        List.generate(StrategyCategories2023.length + 1, (index2) => 
          index2 == 0 ? 
          Center(
            child: Text(
              data['matches'][index]['matchNumber'],
              style: Theme.of(context).textTheme.headline2,
            ),
          ) :
          DashboardTextCard(
            text: data['strategyTables'][0][
              StrategyCategories2023[index2 - 1].replaceAll(' ', '')
              .replaceFirst(
                StrategyCategories2023[index2 - 1][0],
                StrategyCategories2023[index2 - 1][0].toLowerCase())] 
                ?? 'no information',
            width: width / StrategyCategories2023.length + 1,
          )
        )
      ).expand((element) => element).toList(),
    );
  }
}
