import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/teams_data.dart';


class PickList extends StatefulWidget {
  const PickList({
    Key? key,
    required this.teamList,
  }) : super(key: key);

  /// all teams in the page. each team has a card that can be reordered.
  final List<Map<String, dynamic>> teamList;

  @override
  State<PickList> createState() => _PickListState();
}

class _PickListState extends State<PickList> {

  List<bool>? _switches;

  Text title(var team) => Text('${team['id']} - ${TeamsData.allTeams.firstWhere(
      (element) => element.number.toString() == team['id']).name}');

  @override
  Widget build(BuildContext context) {
    _switches ??= List.generate(widget.teamList.length, (index) => false);

    return ReorderableListView(
      shrinkWrap: true,
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          /// moves the item in the list.
          final item = widget.teamList.removeAt(oldIndex);
          widget.teamList.insert(newIndex, item);

          /// replaces pos value of each team with its index.
          widget.teamList.forEach((element) {
            element['pos'] = widget.teamList.indexOf(element).toString();
          });
          
          /// moves the item in the switches list.
          _switches!.insert(newIndex, _switches!.removeAt(oldIndex));
        });
      },

      children: widget.teamList.map((team) => 
        Card(  
          color: Theme.of(context).primaryColorDark,
          elevation: 5,
          key: UniqueKey(),
          child: ListTile(
            textColor: Theme.of(context).hintColor,
            title: title(team),
            leading: Switch(
              value: _switches![widget.teamList.indexOf(team)],
              onChanged: (value) {
                setState(() {
                  _switches![widget.teamList.indexOf(team)] = value;
                });
              },
            ),
          ),
        )
      ).toList()
    );
  }
}