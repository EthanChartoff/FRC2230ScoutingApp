import 'package:flutter/material.dart';


class DrewerDestination extends ListTile {
  const DrewerDestination({
    Key? key,
    super.title,
    super.leading,
    super.onTap,
    this.route,
  }) : super(
    key: key,
  );

  final String? route; 
}