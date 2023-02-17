import 'package:flutter/material.dart';
import 'package:scoute_prime/widgets/not_used/sidemenu.dart';


/// This [Widget] is used to build a screen with [SidemenuDesktop01] and a given [Widget]
class DesktopSidemenuScreenBuilder extends StatelessWidget {

  /// the [Widget] that will be viewed beside the [SidemenuDesktop01]
  final Widget screen;

  const DesktopSidemenuScreenBuilder({
    required this.screen
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SidemenuDesktop01(),
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 45),
            width: double.infinity,
            height: double.infinity,
            child: screen,
          )
        ]
      ),
    );
  }
}
