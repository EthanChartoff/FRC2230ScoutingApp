import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';

class TeamsFiltersDialog extends StatefulWidget {
  const TeamsFiltersDialog({
    required this.yearsParticipated,
    this.onChange
  });

  /// filtre of years team participated in.
  final Filter<String> yearsParticipated;

  final void Function(dynamic)? onChange;

  @override
  State<StatefulWidget> createState() => _TeamsFiltersDialogState();
}

class _TeamsFiltersDialogState extends State<TeamsFiltersDialog> {
  
  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('filters'),
    backgroundColor: Theme.of(context).canvasColor,
    content: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FiltersSearchbox<String>(
        context: context,
        filter: widget.yearsParticipated, 
        onChnage: (item) {
          widget.onChange!(item);
          setState(() {});
        },
        isExpanded: true,
        hintText: 'Years',
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => context.pop(), 
        child: Text('lol')
      )
    ],
  );
}