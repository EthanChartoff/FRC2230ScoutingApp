import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/teams_data.dart';


class PickListScoutingMobile extends StatefulWidget {
  const PickListScoutingMobile({
    Key? key,
    required this.teamList,
  }) : super(key: key);

  /// all teams in the page. each team has a card that can be reordered.
  final List<Map<String, dynamic>> teamList;

  @override
  State<PickListScoutingMobile> createState() => _PickListScoutingMobileState();
}

class _PickListScoutingMobileState extends State<PickListScoutingMobile> {

  Text title(var team) => Text('${team['id']} - ${TeamsData.allTeams.firstWhere(
      (element) => element.number.toString() == team['id']).name}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.teamList.length,
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).primaryColorDark,
        elevation: 5,
        child: ListTile(
          textColor: Theme.of(context).hintColor,
          title: title(widget.teamList[index]),
        )
      ), 
    );
  }
}

