import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/common/searchboxes.dart';

class DashboardNoTeamPage extends StatelessWidget {
  const DashboardNoTeamPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Column(
          children: [
            Text(
              'please select a team',
              style: Theme.of(context).textTheme.headline2,
            ),
            TeamSearchbox(
              context: context,
              teams: TeamsData.allTeams,
              isExpanded: true,
            ),
          ],
        )
      ),
    );
  }
}