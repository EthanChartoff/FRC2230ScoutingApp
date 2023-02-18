import 'package:flutter/material.dart';

class SidemenuDesktopDestination extends NavigationRailDestination {
  const SidemenuDesktopDestination({
    this.key,
    required Widget icon,
    required Widget label,
    this.route,
    this.onSelected
  }) : 
  super(
    icon: icon,
    label: label,
  );

  final Key? key;
  final String? route;
  final VoidCallback? onSelected;
}