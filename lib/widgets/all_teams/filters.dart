import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';

class AllTeamsFilters<T> extends StatelessWidget {
  const AllTeamsFilters({
    Key? key,
    required this.filter,
    this.hintText,
    this.width,
    this.noItemsFoundText,
    this.onChnage,            
    this.itemBuilder,
  }) : super(key: key);

  final Filter<T> filter;

  final String? hintText;

  final double? width;

  final String? noItemsFoundText;

  final void Function(T)? onChnage;

  final Widget Function(BuildContext, dynamic)? itemBuilder;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      height: 50,
      child: Material(
        child: FiltersSearchbox<T>(
          context: context, 
          filter: filter, 
          color: Theme.of(context).colorScheme.secondary,
          isExpanded: true, 
          onChnage: onChnage ?? (item) {},
          hintText: hintText,
          noItemsFoundText: noItemsFoundText,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}