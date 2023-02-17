import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';

class SidemenuDesktop extends StatefulWidget {
  const SidemenuDesktop({
    Key? key,
    required this.destinations,
    required this.router,
    this.onDestinationSelected,
  }) : super(
    key: key,
  );

  final List<SidemenuDesktopDestination> destinations;
  final GoRouter router;
  final VoidCallback? onDestinationSelected;
  
  @override
  State<StatefulWidget> createState() => _SidemenuDesktopState();
}

class _SidemenuDesktopState extends State<SidemenuDesktop> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Theme.of(context).primaryColorDark,

      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
          widget.router.go(widget.destinations[value].route);
        });
        widget.onDestinationSelected?.call();
      },

      destinations: widget.destinations,
    );
  }
}