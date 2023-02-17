import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/desktop/sidemenue/sidemenu_destination.dart';

class SidemenuDesktop extends StatefulWidget {
  const SidemenuDesktop({
    Key? key,
    required this.destinations,
    required this.router,
    this.onDestinationSelected,
    this.onDestinationUnselected,
    this.onLeadingSelected,
  }) : super(
    key: key,
  );

  final List<SidemenuDesktopDestination> destinations;
  final GoRouter router;

  final VoidCallback? onDestinationSelected;
  final VoidCallback? onDestinationUnselected;
  final VoidCallback? onLeadingSelected;
  
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
          widget.destinations[value].route != null ? 
            widget.router.go(widget.destinations[value].route!) : null;
        });

        if(value == 0) {
          widget.onLeadingSelected?.call();
        }

        widget.onDestinationSelected?.call();
        widget.destinations[value].onSelected?.call();
      },

      destinations: widget.destinations,
    );
  }
}