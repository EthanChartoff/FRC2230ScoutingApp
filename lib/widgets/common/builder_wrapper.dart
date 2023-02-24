import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/widgets/common/menu/adaptive_drawer.dart';
import 'package:scoute_prime/widgets/common/menu/adaptive_menu.dart';
import 'package:scoute_prime/widgets/common/menu/menu_destinations.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';

class BuilderWrapper extends StatelessWidget {
  const BuilderWrapper({
    Key? key,
    required this.router,
    required this.child,
  }) : super(key: key);

  final GoRouter router;
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        /// Translate the destinations to the current locale
        final sideDestinationsLocale = [
          ...sideDestinations,
          sideTraillingDestinations
        ].map((e) => SidemenuDesktopDestination(
          title: AppLocalizations.of(context).getManuDetination(e.title),
          icon: e.icon,
          route: e.route,
          onSelected: e.onSelected,
        )).toList();

        final bottomDestinationsLocale = [
          ...bottomDestinations,
          bottomTraillingDestination
        ].map((e) => SidemenuMobileDestination(
          title: AppLocalizations.of(context).getManuDetination(e.title),
          icon: e.icon,
          route: e.route,
          onSelected: e.onSelected,
        )).toList();


        return Scaffold(
          key: scaffoldKey,

          /// The drawer is a panel that slides in from the side 
          /// of the screen. It is typically used to display 
          /// navigation links in an application.
          /// https://api.flutter.dev/flutter/material/Scaffold/drawer.html
          drawer: AdaptiveDrawer(
            router: router,
            bottom: isMobile,
            onDestinationSelected: () {
              scaffoldKey.currentState!.closeDrawer();
            },

            children: drawerDestinations
          ),

          /// The body of the app, the main content of the app.
          /// https://api.flutter.dev/flutter/material/Scaffold/body.html
          body: AdaptiveMenu(
            router: router,
            bottom: isMobile,
            bottomOnSwipeUp: () {
              scaffoldKey.currentState!.openDrawer();
            },

            sideDestinations: sideDestinationsLocale,

            bottomDestinations: bottomDestinationsLocale,

            child: child,
          ),
        ); 
      }                  
    );
  }
}