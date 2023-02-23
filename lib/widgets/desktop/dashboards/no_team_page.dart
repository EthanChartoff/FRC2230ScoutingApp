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
      height: double.infinity,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'please select a team',
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}