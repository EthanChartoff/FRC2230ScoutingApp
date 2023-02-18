import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/common/menu/adaptive_drawer.dart';
import 'package:scoute_prime/widgets/common/menu/adaptive_menu.dart';
import 'package:scoute_prime/widgets/common/menu/menu_destinations.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';

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

    var sideLeadingDestinationOpenDrewer = SidemenuDesktopDestination(
      icon: sideLeadingDestination.icon, 
      label: sideLeadingDestination.label,
      onSelected: () {
        scaffoldKey.currentState!.openDrawer();
      },
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

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

            sideDestinations: [
              sideLeadingDestinationOpenDrewer,
              ...sideDestinations,
              sideTraillingDestinations
            ],

            bottomDestinations: const [
              ...bottomDestinations,
              bottomTraillingDestination
            ],

            child: child,
          ),
        ); 
      }                  
    );
  }
}