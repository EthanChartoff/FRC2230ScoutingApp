
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/mobile/pick_list/pick_list_scouting.dart';


class PickListPageScoutingMobile extends StatefulWidget {
  const PickListPageScoutingMobile({
    super.key,
    required this.teamsFromDb,
    this.teams,
  });

  /// future that gets all the teams from a db that stores the teams positions. 
  final Future<List> Function() teamsFromDb;

  /// all teams in the page. each team has a card that can be reordered.
  final List<TeamsData>? teams;

  /// orgenizes the teamList by the pos value of each team.
  List<Map<String, dynamic>> orgenizedTeamList(List<Map<String, dynamic>> teamList) => 
    List.generate(teamList.length, (index) {
      return teamList.firstWhere((element) {
        return element['pos'] == index.toString();
      });
    });

  @override
  State<StatefulWidget> createState() => _PickListPageScoutingMobileState();
}

class _PickListPageScoutingMobileState extends State<PickListPageScoutingMobile> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: FutureBuilder(
        future: widget.teamsFromDb(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
                primaryColorDark: Theme.of(context).primaryColorDark,
                hintColor: Theme.of(context).colorScheme.secondary,
                textTheme: TextTheme(
                  headline2: Theme.of(context).textTheme.headline2
                )
              ),
              child: PageView(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          AppLocalizations.of(context).picklistPageTitle('1'),
                          style: Theme.of(context).textTheme.headline2
                        ),
                      ),
                      Expanded(
                        child: PickListScoutingMobile(
                          teamList: widget.orgenizedTeamList(
                            snapshot.data!.map((team) {
                              return {
                                'id': team['id'],
                                'pos': team['picklistPos1'],
                                'selected': team['isSelected1']
                              };
                            }).toList()
                          )
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          AppLocalizations.of(context).picklistPageTitle('2'),
                          style: Theme.of(context).textTheme.headline2
                        ),
                      ),
                      Expanded(
                        child: PickListScoutingMobile(
                          teamList: widget.orgenizedTeamList(
                            snapshot.data!.map((team) {
                              return {
                                'id': team['id'],
                                'pos': team['picklistPos2'],
                                'selected': team['isSelected2']
                              };
                            }).toList()
                          )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

