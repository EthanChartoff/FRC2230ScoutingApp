import 'package:flutter/material.dart';

class SidemenuMobileDestination extends NavigationDestination {
  const SidemenuMobileDestination({
    Key? key,
    required Widget icon,
    required this.title,
    this.route,
    this.onSelected,
  }) : 
  super(
    icon: icon,
    label: title,
  );

  final String title;

  final String? route;
  final VoidCallback? onSelected;
}