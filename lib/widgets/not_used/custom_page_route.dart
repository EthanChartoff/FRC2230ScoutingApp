import 'package:flutter/material.dart' show MaterialPageRoute;


/// Overriding [MaterialPageRoute] so animation time between routes 
/// will be 0.
/// 
/// """inspired""" by https://stackoverflow.com/a/63561036
class FastPageRoute extends MaterialPageRoute {
  FastPageRoute({
    builder, 
    settings
  }) : super(
    builder: builder, 
    settings: settings
  );

  @override
  Duration get transitionDuration => const Duration(milliseconds: 10);
}