import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/matches/filters_dialog.dart';
import 'package:scoute_prime/widgets/common/searchboxes.dart' show Filter;
import 'package:scoute_prime/misc/teams_data.dart';

class MatchesFiltersCard extends StatelessWidget {

  const MatchesFiltersCard({
    required this.value,
    required this.onChanged,
    required this.teams,
    required this.years,
    required this.events
  });

  final dynamic value;

  final dynamic onChanged;

  final Filter<TeamsData> teams;

  final Filter<String> years;

  final Filter<dynamic> events;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Theme(
        data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
        child: SizedBox(
          width: 300,
          height: 50,
          child: TextButton(
            onPressed: () => showDialog(
              context: context, 
              builder: (context) => MatchesFiltersDialog(
                value: value,
                onChanged: onChanged,
                teams: teams,
                years: years,
                events: events,
              )
            ),

            child: Text(
              'filters',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}