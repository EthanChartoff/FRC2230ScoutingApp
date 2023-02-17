import 'package:flutter/material.dart';

class SidemenuDesktopDestination extends NavigationRailDestination {
  const SidemenuDesktopDestination({
    Key? key,
    required Widget icon,
    required Widget label,
    required this.route,
  }) : 
  super(
    icon: icon,
    label: label,
  );

  final String route;
}