import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:scoute_prime/api/TBA/get_event.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';
import 'package:scoute_prime/misc/teams_data.dart';

class MatchesFiltersDialog extends StatefulWidget {

  const MatchesFiltersDialog({
    required this.value,
    required this.onChanged,
    required this.teams,
    required this.years,
    required this.events
  });
  
  /// value of switch
  /// 
  /// 
  final bool value;

  /// What happens when the switch's value is changed.
  /// 
  /// will be something like this:
  /// (value) => setState(() {
  //   controller.value = value!;
  // }), 
  final void Function(bool?) onChanged;

  /// contents of filter cards
  final Filter<TeamsData> teams;
  final Filter<String> years;
  final Filter<dynamic> events;

  @override
  State<StatefulWidget> createState() => _MatchesFiltersDialogState();

}

class _MatchesFiltersDialogState extends State<MatchesFiltersDialog> {
  bool switchFlag = true;

  Widget searchCard({
    required String title,
    List<Widget>? children,
    }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Theme(
        data: ThemeData(hoverColor: Theme.of(context).hoverColor.withOpacity(0.1)),
        child: ExpansionTile(
          collapsedTextColor: Colors.black,
          textColor: Colors.black,
          iconColor: Colors.black,

          title: Text(title),

          children: children ?? [],


        ),
      )
    ),
  );

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('TBA'),
                
          Switch(
            activeColor: Theme.of(context).hoverColor,
            inactiveTrackColor: Theme.of(context).hoverColor,
            inactiveThumbColor: Theme.of(context).hoverColor,
            value: switchFlag, 
            onChanged: (value) {
              setState(() {
                widget.onChanged(value);
                switchFlag = value;
              });
            }
          ),
                
          const Text('2230'),
        ],
      ),
      backgroundColor: Theme.of(context).canvasColor,
      
      content: Builder(
        builder: (context) {
          // Get available height of the build area of this widget. 
          var height = MediaQuery.of(context).size.height;
          return SizedBox(
            width: 500,
            height: max(height - 200, 100),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FiltersSearchbox<TeamsData>(
                    context: context, 
                    filter: widget.teams,
                    onChnage: (item) {
                      setState(() {});
                    },
                    itemBuilder: (context, TeamsData suggestions) => ListTile(
                      title: Text("${suggestions.number} ${suggestions.name}"),
                      textColor: Colors.black12,
                      tileColor: Colors.black12,
                      focusColor: Colors.amber,
                    ),
                    suggestionsCallback: (final String pattern) {
                      return widget.teams.items.where((element) {
                        if(pattern.startsWith(RegExp(r'[1-9]'))) {
                          return element.number.toString().startsWith(pattern);
                        }
                        return element.name.startsWith(pattern);
                      }).toList()..sort(
                        (a, b) => a.number.compareTo(b.number) 
                      );
                    },
                    isExpanded: true,
                    hintText: 'Teams',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FiltersSearchbox<String>(
                    context: context,
                    filter: widget.years, 
                    onChnage: (item) async {
                      widget.events.items = await GetEventsTBA.eventsInYears(widget.years.selectedItems);
                      widget.events.items.removeWhere((element) => widget.events.selectedItems.contains(element));
                      setState(() {});
                    },
                    isExpanded: true,
                    hintText: 'Years',
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FiltersSearchbox(
                    context: context, 
                    filter: widget.events,
                    onChnage: (item) async {
                      widget.events.items.removeWhere((element) => widget.events.selectedItems.contains(element));
                      setState(() {});
                    },

                    itemBuilder: (context, suggestions) => ListTile(
                      title: Text("${suggestions['name']} - ${suggestions['year']}"),
                      textColor: Colors.black12,
                      tileColor: Colors.black12,
                      focusColor: Colors.amber,
                    ),

                    suggestionsCallback: (final String pattern) {
                      return widget.events.items.where((element) {
                        if(pattern.startsWith(RegExp(r'[1-9]'))) {
                          return element['year'].toString().startsWith(pattern);
                        }
                        return element['name'].startsWith(pattern);
                      }).toList()..sort(
                        (a, b) => a['year'].compareTo(b['year']) 
                      );
                    },
                    isExpanded: true,
                    hintText: 'Events',
                  ),
                ),      

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    SizedBox(
                      width: 100,
                      height: 400,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.teams.selectedItems.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(widget.teams.selectedItems[index].name),
                        ) 
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      height: height - 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.years.selectedItems.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(widget.years.selectedItems[index]),
                          onTap: () async {
                            setState(() {
                              widget.years.onUnselect(widget.years.selectedItems[index]);
                            });
                            widget.events.items = await GetEventsTBA.eventsInYears(widget.years.selectedItems);
                            widget.events.items.removeWhere((element) => widget.events.selectedItems.contains(element));
                          },
                        ) 
                      ),
                    ),
                    
                    SizedBox(
                      width: 100,
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.events.selectedItems.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(widget.events.selectedItems[index]['name']),
                          onTap: () async {
                            setState(() {
                              widget.events.onUnselect(widget.events.selectedItems[index]);
                            });
                            widget.events.items = await GetEventsTBA.eventsInYears(widget.years.selectedItems);
                            widget.events.items.removeWhere((element) => widget.events.selectedItems.contains(element));
                          },
                        ) 
                      ),
                    )

                  ],
                )            
              ],
            ),
          );
        }
      ),
  
      actions: [
        TextButton(
          onPressed: () => context.pop(), 
          child: Text('lol')
        )
      ],
    );
  }
}
