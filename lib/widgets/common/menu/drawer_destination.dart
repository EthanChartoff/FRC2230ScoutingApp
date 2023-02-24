import 'package:flutter/material.dart';


class DrewerDestination extends ListTile {
  DrewerDestination({
    Key? key,
    String? title,
    super.leading,
    super.onTap,
    this.route,
  }) : super(
    key: key,
    title: title != null ? Text(title) : null,
  );

  final String? route; 
}