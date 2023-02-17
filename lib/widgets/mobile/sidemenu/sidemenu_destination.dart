import 'package:flutter/material.dart';

class SidemenuMobileDestination extends NavigationDestination {
  const SidemenuMobileDestination({
    Key? key,
    required Widget icon,
    required String label,
    required this.route,
  }) : 
  super(
    icon: icon,
    label: label,
  );

  final String route;
}