import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scoute_prime/misc/routing.dart';

import 'package:scoute_prime/variables/teams_data.dart';


class TeamSearchbox extends TypeAheadField<TeamsData> {

  final BuildContext context;

  final List<TeamsData> teams;

  final String? hintText;

  TeamSearchbox({
    required this.context,
    required this.teams,
    suggestionsCallback, 
    itemBuilder, 
    onSuggestionSelected,
    textFieldConfiguration,
    this.hintText,
    super.debounceDuration,
    noItemsFoundBuilder
  }) : super(
    textFieldConfiguration: textFieldConfiguration ?? TextFieldConfiguration(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(),
        hintText: hintText,
        fillColor: Theme.of(context).primaryColor
      )
    ),

    suggestionsCallback: suggestionsCallback ?? (final String pattern) {
      return teams.where((element) {
        if(pattern.startsWith(RegExp(r'[1-9]'))) {
          return element.number.toString().startsWith(pattern);
        }
        return element.name.startsWith(pattern);
      }).toList()..sort(
        (a, b) => a.number.compareTo(b.number) 
      );
    },

    itemBuilder: itemBuilder ?? (context, suggestions) => ListTile(
      title: Text("${suggestions.number} ${suggestions.name}"),
    ),

    noItemsFoundBuilder: noItemsFoundBuilder ?? (final BuildContext context) => Container(
        height: 60,
        child: const Center(
          child: Text(
            "No Teams Found",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),

    onSuggestionSelected: onSuggestionSelected ?? (suggestion) {
      Navigator.popAndPushNamed(context, Routing.TEAM_VIEW + suggestion.number.toString());
    }
  );
}