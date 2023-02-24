
import 'package:flutter/material.dart' show Icon, Icons;

import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/menu/drawer_destination.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';


SidemenuDesktopDestination sideLeadingDestination = 
  SidemenuDesktopDestination(
    icon: const Icon(Icons.menu),
    title: 'menu',
  );

List<SidemenuDesktopDestination> sideDestinations = [
  SidemenuDesktopDestination(
    icon: const Icon(Icons.airline_seat_flat),
    title: 'matches',
    route: Routing.MATCHES,
  ),

  SidemenuDesktopDestination(
    icon: const Icon(Icons.search), 
    title: 'teams',
    route: Routing.TEAM_DASHBOARD,
  ),

  SidemenuDesktopDestination(
    icon: const Icon(Icons.airline_seat_recline_extra_outlined),
    title: 'picklist',
    route: Routing.PICK_LIST,
  ),
  /*
  SidemenuDesktopDestination(
    icon: Icon(Icons.attach_money),
    title: ('all teams'),
    route: Routing.ALL_TEAMS,
  ),
  */
];  

SidemenuDesktopDestination sideTraillingDestinations = 
  SidemenuDesktopDestination(
    icon: const Icon(Icons.attribution),
    title: 'login',
    route: Routing.LOGIN,
  );


const SidemenuMobileDestination bottomLeadingDestination = 
  SidemenuMobileDestination(
    icon: Icon(Icons.menu),
    title: 'menu',
  );

const List<SidemenuMobileDestination> bottomDestinations = [
  SidemenuMobileDestination(
    icon: Icon(Icons.airline_seat_flat),
    title: 'matches',
    route: Routing.MATCHES,
  ),

  SidemenuMobileDestination(
    icon: Icon(Icons.search), 
    title: 'teams',
    route: Routing.TEAM_DASHBOARD,
  ),
  
  SidemenuMobileDestination(
    icon: Icon(Icons.airline_seat_recline_extra_outlined),
    title: 'picklist',
    route: Routing.PICK_LIST,
  ),
  /*
  SidemenuMobileDestination(
    icon: Icon(Icons.attach_money),
    title: 'all teams',
    route: Routing.ALL_TEAMS,
  ),
  */
];

const SidemenuMobileDestination bottomTraillingDestination = 
  SidemenuMobileDestination(
    icon: Icon(Icons.attribution),
    title: 'login',
    route: Routing.LOGIN,
  );


List<DrewerDestination> drawerDestinations = [
  DrewerDestination(
    leading: const Icon(Icons.airline_seat_flat),
    title: 'matches',
    route: Routing.MATCHES,
  ),
  DrewerDestination(
    leading: const Icon(Icons.airline_seat_recline_extra_outlined),
    title: 'picklist',
    route: Routing.PICK_LIST,
  ),
  /*
  DrewerDestination(
    leading: Icon(Icons.attach_money),
    title: ('all teams'),
    route: Routing.ALL_TEAMS,
  ),
  */
  DrewerDestination(
    leading: const Icon(Icons.attribution),
    title: ('login'),
    route: Routing.LOGIN,
  ),
  
];