import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/teams_data.dart';


class PickListMobile extends StatefulWidget {
  const PickListMobile({
    Key? key,
    required this.teamList,
  }) : super(key: key);

  /// all teams in the page. each team has a card that can be reordered.
  final List<Map<String, dynamic>> teamList;

  @override
  State<PickListMobile> createState() => _PickListMobileState();
}

class _PickListMobileState extends State<PickListMobile> {
  Text title(var team) => Text('${team['id']} - ${TeamsData.allTeams.firstWhere(
      (element) => element.number.toString() == team['id']).name}');

  @override
  Widget build(BuildContext context) {
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
        });
      },

      children: List.generate(widget.teamList.length, (index) => 
        Card(  
          color: Theme.of(context).primaryColorDark,
          elevation: 5,
          key: UniqueKey(),
          child: ListTile(
            textColor: Theme.of(context).hintColor,
            title: title(widget.teamList[index]),
            leading: Switch(
              value: widget.teamList[index]['selected'] == '1' ? true : false,
              onChanged: (value) {
                setState(() {
                  widget.teamList[index]['selected'] = value ? '1' : '0';
                });
              },
            ),
          ),
        )
      )
    );
  }
}