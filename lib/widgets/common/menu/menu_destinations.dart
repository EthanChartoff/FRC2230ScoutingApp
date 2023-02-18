
import 'package:flutter/material.dart' show Icon, Icons, ListTile, Text, ValueKey, Widget;

import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/menu/drewer_destination.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';


const SidemenuDesktopDestination sideLeadingDestination = 
  SidemenuDesktopDestination(
    icon: Icon(Icons.menu),
    label: Text('menu'),
  );

const List<SidemenuDesktopDestination> sideDestinations = [
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
  /// TODO: using key like this is bad practice, but it works for now. 
  SidemenuDesktopDestination(
    key: ValueKey('teams'),
    icon: Icon(Icons.search), 
    label: Text('Teams'),
  )
];

const SidemenuDesktopDestination sideTraillingDestination = 
  SidemenuDesktopDestination(
    icon: Icon(Icons.attribution),
    label: Text('login'),
    route: Routing.LOGIN,
  );


const SidemenuMobileDestination bottomLeadingDestination = 
  SidemenuMobileDestination(
    icon: Icon(Icons.menu),
    label: 'menu',
  );

const List<SidemenuMobileDestination> bottomDestinations = [
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
];


const List<DrewerDestination> drawerDestinations = [
  DrewerDestination(
    leading: Icon(Icons.airline_seat_flat),
    title: Text('matches'),
    route: Routing.MATCHES,
  ),
  DrewerDestination(
    leading: Icon(Icons.airline_seat_recline_extra_outlined),
    title: Text('pick-list'),
    route: Routing.PICK_LIST,
  ),
  DrewerDestination(
    leading: Icon(Icons.attach_money),
    title: Text('all teams'),
    route: Routing.ALL_TEAMS,
  ),
  DrewerDestination(
    leading: Icon(Icons.attribution),
    title: Text('login'),
    route: Routing.LOGIN,
  ),
];