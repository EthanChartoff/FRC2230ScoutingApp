import 'package:flutter/material.dart';

class SidemenuDesktopDestination extends NavigationRailDestination {
  SidemenuDesktopDestination({
    required this.title,
    required Widget icon,
    this.route,
    this.onSelected
  }) : 
  super(
    icon: icon,
    label: Text(title),
  );

  final String title;

  final String? route;
  final VoidCallback? onSelected;
}