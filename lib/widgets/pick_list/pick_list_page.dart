
import 'package:flutter/material.dart';

import 'package:scoute_prime/api/2230_database/dart/get/teams.dart';
import 'package:scoute_prime/misc/teams_data.dart';
import 'package:scoute_prime/widgets/pick_list/pick_list.dart';


class PickListPage extends StatefulWidget {
  const PickListPage({
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
  State<StatefulWidget> createState() => _PickListPageState();
}

class _PickListPageState extends State<PickListPage> {

  List<Map<String, dynamic>>? _pickListTeams1;
  List<Map<String, dynamic>>? _pickListTeams2;

  PickList? _pickList1;
  PickList? _pickList2;

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      
      child: FutureBuilder(
        future: widget.teamsFromDb(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {

            _pickListTeams1 ??= widget.orgenizedTeamList(
              snapshot.data!.map((team) {
                return {
                  'id': team['id'],
                  'pos': team['picklistPos1'],
                };
              }).toList());


            _pickListTeams2 ??= widget.orgenizedTeamList(
              snapshot.data!.map((team) {
                return {
                  'id': team['id'],
                  'pos': team['picklistPos2'],
                };
              }).toList());

            _pickList1 ??= PickList(
              teamList: _pickListTeams1!
            );

            _pickList2 ??= PickList(
              teamList: _pickListTeams2!
            );


            return Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
                primaryColorDark: Theme.of(context).primaryColorDark,
                hintColor: Theme.of(context).colorScheme.secondary,
                textTheme: TextTheme(
                  headline2: Theme.of(context).textTheme.headline2
                )
              ),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: _pickList1
                      ),
                
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: _pickList2
                      ),
                
                      ElevatedButton(
                        onPressed: () => GetTeamsData.updatePicklistIndexes(
                          teamsPos1: _pickListTeams1!,
                          teamsPos2: _pickListTeams2!
                        ),
                        child: null
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          else {
            return const CircularProgressIndicator();
          }
        }
      ),
    );
  }

}