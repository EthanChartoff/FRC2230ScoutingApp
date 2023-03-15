import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:go_router/go_router.dart';


import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/common/searchboxes.dart';

class DashboardNoTeamPage extends StatelessWidget {
  const DashboardNoTeamPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context).teamSearchTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TeamSearchbox(
                context: context,
                teams: TeamsData.allTeams,
                isExpanded: true,

                itemBuilder: (_, TeamsData suggestion) {
                  return GestureDetector(
                    onPanDown: (_) {
                      context.go('${Routing.TEAM_DASHBOARD}?teamId=${suggestion.number}');
                    },
                    child: ListTile(
                      dense: true,
                      title: Text(
                        '#${suggestion.number} ${suggestion.name}',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: 14
                        ),
                      ),
                    ),
                  );
                },
                onSuggestionSelected: (p0) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}