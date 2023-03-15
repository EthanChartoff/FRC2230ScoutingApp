import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/misc/constants.dart';

import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/misc/teams_data.dart';


/// A searchbox for teams.
class TeamSearchbox extends TypeAheadField<TeamsData> {
  TeamSearchbox({
    required this.context,
    required this.teams,
    suggestionsCallback, 
    itemBuilder, 
    void Function(TeamsData)? onSuggestionSelected,
    textFieldConfiguration,
    this.hintText,
    super.debounceDuration,
    noItemsFoundBuilder,
    autoFocus,
    onTap,
    required bool isExpanded
  }) : super(
    textFieldConfiguration: textFieldConfiguration ?? TextFieldConfiguration(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorLight
          ),
          gapPadding: 8.0
        ),
        border: const OutlineInputBorder(),
        hintText: hintText,
        fillColor: Theme.of(context).primaryColor,
      ),
      style: Theme.of(context).textTheme.headline3,
      onTap: onTap,
      maxLines: 1
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
      title: Text(
        '#${suggestions.number} ${suggestions.name}',
        style: Theme.of(context).textTheme.headline3!.copyWith(
          fontSize: 14
        ),
      ),
      tileColor: Theme.of(context).primaryColorDark,
    ),

    noItemsFoundBuilder: noItemsFoundBuilder ?? (final BuildContext context) => Container(
      color: Theme.of(context).primaryColorDark,
        height: 60,
        child: Center(
          child: Text(
            "No Teams Found",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),

    onSuggestionSelected: onSuggestionSelected ?? (suggestion) {
      context.go('${Routing.TEAM_DASHBOARD}?teamId=${suggestion.number}');
    }
  );

  /// The context of the widget.
  final BuildContext context;

  /// The list of teams that will be searched.
  final List<TeamsData> teams;

  final String? hintText;

}

/// A searchbox that filters the items in the [filter] parameter.
/// 
/// The [filter] parameter is a [Filter] object that contains the items
/// that can be selected and the selected items.
/// 
/// The [onChnage] parameter is a function that runs when the selected
/// items change.
/// 
/// The [hintText] parameter is the text that will be displayed in the
/// searchbox when there is no text.
class FiltersSearchbox<T> extends TypeAheadField<T> {
  FiltersSearchbox({
    required this.context,
    required this.filter,
    required bool isExpanded,
    required this.onChnage,
    this.color,
    this.noItemsFoundText,
    suggestionsCallback, 
    itemBuilder, 
    textFieldConfiguration,
    this.hintText,
    super.debounceDuration,
    noItemsFoundBuilder,
    autoFocus,
    onTap,
  }) : super(
    textFieldConfiguration: textFieldConfiguration ?? TextFieldConfiguration(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
        ),
        hintText: filter.selectedItems.isNotEmpty ? 
          filter.selectedItems.first.toString() : hintText,
        fillColor: color ?? Theme.of(context).primaryColorDark,
        filled: true,
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16
      ),
      onTap: onTap,
      maxLines: 1
    ),

    suggestionsCallback: suggestionsCallback ?? (final String pattern) {
      return filter.items.where((element) {
        if(pattern.startsWith(RegExp(r'[1-9]'))) {
          return element.toString().startsWith(pattern);
        }
        return element.toString().startsWith(pattern);
      }).toList()..sort(
        (a, b) => a.toString().compareTo(b.toString())   
      );
    },

    itemBuilder: itemBuilder ?? (context, suggestions) => Card(
      color: Theme.of(context).colorScheme.secondary,
      child: Text(suggestions.toString(),
        style: const TextStyle(
          color: Colors.black
        ),
      ),
    ),

    noItemsFoundBuilder: noItemsFoundBuilder ?? (final BuildContext context) => 
      SizedBox(
        height: 60,
        child: Center(
          child: Text(
            noItemsFoundText ?? "No Items Found",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),

    /// When an item is selected, it is removed from the [filter.items]
    /// list and added to the [filter.selectedItems] list.
    /// 
    /// The [onChnage] function is then called with the selected item.
    onSuggestionSelected: (item) {
      filter.onSelect(item);
      onChnage(item);
    }
  );

  final BuildContext context;

  final String? hintText;

  final Filter<T> filter;

  final void Function(T item) onChnage;

  final Color? color;

  final String? noItemsFoundText;
}

class Filter<T>{
  Filter({
    required this.items,
    required this.selectedItems,
  }) : 
  onSelect = ((T item) {
    if(!selectedItems.contains(item)) {
      items.remove(item);
      selectedItems.add(item);
    }
  }),
  onUnselect = ((T item) {
    if(!items.contains(item)) {
      selectedItems.remove(item);
      items.add(item);
    }
  });

  Filter.maxOneSelectedItem({
    required this.items,
    required this.selectedItems,
  }) : onSelect = ((T item) {
    if(!selectedItems.contains(item)) {
      items.remove(item);
      selectedItems.add(item);
    }
    if(selectedItems.length > 1) {
      items.add(selectedItems.first);
      selectedItems.removeAt(0);
    }
  }),
  onUnselect = ((T item) {
    if(!items.contains(item)) {
      selectedItems.remove(item);
      items.add(item);
    }
  });

  /// All the items that can be selected by the filter, for example:
  /// Years: 1992, 1993...2023 
  List<T> items;

  /// The selected items that will filter the output. 
  List<T> selectedItems;

  /// Function that runs when an item is selected, 
  /// the parameter is the item.
  final void Function(T item) onSelect;

  /// Function that runs when a selected item unselected, 
  /// the parameter is the item.
  final void Function(T item) onUnselect;
}