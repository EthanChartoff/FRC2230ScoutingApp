import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoute_prime/api/TBA/get_event.dart';
import 'package:scoute_prime/api/TBA/get_matches.dart';
import 'package:scoute_prime/widgets/all_teams/filters.dart';
import 'package:scoute_prime/widgets/all_teams/graph.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';


/// Page of the all teams page, The page is used to analyze a single datapoint 
/// of a select group of teams.
class AllTeamsPage extends StatefulWidget {
  const AllTeamsPage({Key? key}) : super(key: key);
  
  @override
  State<StatefulWidget> createState() => _AllTeamsPageState();
}

class _AllTeamsPageState extends State<AllTeamsPage> {

  Map<String, AllTeamsFilters<String>>? _filters;
  AllTeamsGraph _mainGraph = AllTeamsGraph();

  Future get _getPageData async {
    _filters ??= {
      /// shows all years from 1992 to current year
      'years' : AllTeamsFilters<String>(
        filter: Filter<String>.maxOneSelectedItem(
          items: [for (var i = 1992; i <= DateTime.now().year; i++) i.toString()],
          selectedItems: []
        ),
        hintText: 'Year',
        noItemsFoundText: 'No years found',
        onChnage: (item) async {
          _filters!['events']!.filter.items = 
            await GetEventsTBA.eventsNameInYears([item.toString()])
              .then((value) => value.map((e) => e.toString()).toList());
              
          setState(() {});
        },
      ),
      /// shows all events in the selected year
      /// items are set in onChnage of years filter
      'events' : AllTeamsFilters<String>(
        filter: Filter<String>.maxOneSelectedItem(
          items: [],
          selectedItems: []
        ),
        hintText: 'Event',
        onChnage: (value) async {
          _filters!['graph']!.filter.items = 
            await GetMatchesTBA.matchesScoreBreakdownInEvent({
              'key': value.split(' - ').last
            }).then((value) => value.map((e) => e.toString()).toList());
          setState(() {});
        },
        noItemsFoundText: 'No events found',
        itemBuilder: (context, suggestions) => Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(suggestions,
            style: const TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
      /// shows all available data points from the selected event,
      /// items are set in onChnage of events filter
      'graph' : AllTeamsFilters<String>(
        filter: Filter<String>.maxOneSelectedItem(
          items: [],
          selectedItems: []
        ),
        hintText: 'Graph Data',
        onChnage: (value) => setState(() {}),
        noItemsFoundText: 'No data points found',
        itemBuilder: (context, suggestions) => Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(suggestions,
            style: const TextStyle(
              color: Colors.black
            ),
          ),
        ),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: FutureBuilder(
        future: _getPageData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                /// Row of filters
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _filters!.map<String, AllTeamsFilters<String>>
                      ((key, value) {
                        double filterWidth = 200;
                        var sideMenuWidth = 150;
    
                        return MapEntry(key, AllTeamsFilters<String>(
                          filter: value.filter,
                          hintText: value.hintText,
                          noItemsFoundText: value.noItemsFoundText,
                          width: min((MediaQuery.of(context).size.width 
                            - sideMenuWidth) / _filters!.length, filterWidth),
                          onChnage: value.onChnage,
                          itemBuilder: value.itemBuilder,
                        ));
                      }).values.toList()
                    ),
                  ),
                ),
          
                SizedBox(
                  height: MediaQuery.of(context).size.height - 58,
                  child: _mainGraph
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}