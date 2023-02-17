import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';


class AdaptiveSidemenu extends Builder {
  AdaptiveSidemenu({
    Key? key,
    required GoRouter router,
    required bool bottom,

    Widget? child,
    VoidCallback? onDestinationSelected,
    VoidCallback? onDestinationUnselected,
    VoidCallback? onLeadingSelected,
    bool showLeading = true,

    SidemenuDesktopDestination sideLeadingDestination = 
      const SidemenuDesktopDestination(
        icon: Icon(Icons.menu),
        label: Text('menu'),
      ),
    List<SidemenuDesktopDestination> sideDestinations = const [
      SidemenuDesktopDestination(
        icon: Icon(Icons.airline_seat_flat),
        label: Text('matches'),
        route: Routing.MATCHES,
      ),
      SidemenuDesktopDestination(
        icon: Icon(Icons.airline_seat_recline_extra_outlined),
        label: Text('pick-list'),
        route: Routing.PICK_LIST,
      ),
      SidemenuDesktopDestination(
        icon: Icon(Icons.attach_money),
        label: Text('all teams'),
        route: Routing.ALL_TEAMS,
      ),
      SidemenuDesktopDestination(
        icon: Icon(Icons.attribution),
        label: Text('login'),
        route: Routing.LOGIN,
      ),
    ],

    SidemenuMobileDestination bottomLeadingDestination = 
      const SidemenuMobileDestination(
        icon: Icon(Icons.menu),
        label: 'menu',
      ),
    List<SidemenuMobileDestination> bottomDestinations = const [
      SidemenuMobileDestination(
        icon: Icon(Icons.airline_seat_flat),
        label: 'matches',
        route: Routing.MATCHES,
      ),
      SidemenuMobileDestination(
        icon: Icon(Icons.airline_seat_recline_extra_outlined),
        label: 'pick-list',
        route: Routing.PICK_LIST,
      ),
      SidemenuMobileDestination(
        icon: Icon(Icons.attach_money),
        label: 'all teams',
        route: Routing.ALL_TEAMS,
      ),
      SidemenuMobileDestination(
        icon: Icon(Icons.attribution),
        label: 'login',
        route: Routing.LOGIN,
      ),
    ],
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
              destinations: showLeading ? 
                [sideLeadingDestination, ...sideDestinations] : 
                sideDestinations,
              router: router,
              onDestinationSelected: onDestinationSelected,
              onLeadingSelected: showLeading ? onLeadingSelected : null,
            ),
            Expanded(child: child ?? ErrorWidget('child is null'))
          ]
        );
      } else {
        return Column(
          children: [
            Expanded(child: child ?? ErrorWidget('child is null')),
            SidemenuMobile(
              destinations: showLeading ? 
                [bottomLeadingDestination, ...bottomDestinations] : 
                bottomDestinations,
              router: router,
              onDestinationSelected: onDestinationSelected,
              onLeadingSelected: showLeading ? onLeadingSelected : null,
            )
          ]
        );
      }
    },
  );
}