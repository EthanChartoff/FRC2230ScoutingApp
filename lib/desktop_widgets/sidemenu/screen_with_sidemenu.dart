import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scoute_prime/desktop_widgets/sidemenu/sidemenu.dart';

/// This [Widget] is used to build a screen with [DesktopSidemenu] and a given [Widget]
class DesktopSidemenuScreenBuilder extends StatelessWidget {

  /// the [Widget] that will be viewed beside the [DesktopSidemenu]
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
          DesktopSidemenu(),
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
