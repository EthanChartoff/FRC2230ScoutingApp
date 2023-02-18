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

    // SidemenuDesktopDestination? sideLeadingDestination,
    // SidemenuDesktopDestination? sideTraillingDestination,
    // SidemenuMobileDestination? bottomLeadingDestination,
    // SidemenuMobileDestination? bottomTraillingDestination,

    // bool showLeading = true,
    // bool showTrailling = true,

    Widget? child,
    VoidCallback? onDestinationSelected,
    VoidCallback? onDestinationUnselected,
    // VoidCallback? onLeadingSelected,
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
              destinations: [
                // if(showLeading && sideLeadingDestination != null) 
                //   sideLeadingDestination,

                ...sideDestinations,

                // if(showTrailling && sideTraillingDestination != null) 
                //   sideTraillingDestination,
              ],
              router: router,
              onDestinationSelected: onDestinationSelected,
              // onLeadingSelected: showLeading && sideLeadingDestination != null ? onLeadingSelected : null,
            ),
            Expanded(child: child ?? ErrorWidget('child is null'))
          ]
        );
      } else {
        return Column(
          children: [
            Expanded(child: child ?? ErrorWidget('child is null')),
            SidemenuMobile(
              destinations: [
                // if(showLeading && bottomLeadingDestination != null) 
                //   bottomLeadingDestination,

                ...bottomDestinations,

                // if(showTrailling && bottomTraillingDestination != null) 
                //   bottomTraillingDestination,
              ],
              router: router,
              onDestinationSelected: onDestinationSelected,
              // onLeadingSelected: showLeading ? onLeadingSelected : null,
            )
          ]
        );
      }
    },
  );
}