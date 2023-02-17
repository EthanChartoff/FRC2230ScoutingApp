import 'package:flutter/material.dart';

class SidemenuMobileDestination extends NavigationDestination {
  const SidemenuMobileDestination({
    Key? key,
    required Widget icon,
    required String label,
    this.route,
    this.onSelected,
  }) : 
  super(
    icon: icon,
    label: label,
  );

  final String? route;
  final VoidCallback? onSelected;
}