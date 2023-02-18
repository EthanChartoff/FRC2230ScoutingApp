import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';


class AdaptiveMenu extends Builder {
  AdaptiveMenu({
    Key? key,
    required GoRouter router,
    required bool bottom,
    required List<SidemenuDesktopDestination> sideDestinations,
    required List<SidemenuMobileDestination> bottomDestinations,

    Widget? child,
    VoidCallback? onDestinationSelected,
    VoidCallback? onDestinationUnselected,

    VoidCallback? bottomOnSwipeUp,
  }) : 
  super(
    key: key,
    builder: (context) {
      if(router.location == Routing.LOGIN) {
        return child ?? ErrorWidget('child is null');
      }
      else if (!bottom) {
        return Row(
          children: [
            SidemenuDesktop(
              destinations: sideDestinations,
              router: router,
              onDestinationSelected: onDestinationSelected,
            ),
            Expanded(child: child ?? ErrorWidget('child is null'))
          ]
        );
      } else {
        return Column(
          children: [
            Expanded(child: child ?? ErrorWidget('child is null')),
            SidemenuMobile(
              destinations: bottomDestinations,
              router: router,
              onDestinationSelected: onDestinationSelected,
              onSwipeUp: bottomOnSwipeUp,
            )
          ]
        );
      }
    },
  );
}