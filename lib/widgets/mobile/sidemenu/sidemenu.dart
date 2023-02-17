import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';

class SidemenuMobile extends StatefulWidget {
   const SidemenuMobile({
    Key? key,
    required this.destinations,
    required this.router,
    this.onDestinationSelected,
  }) : super(
    key: key,
  );

  final List<SidemenuMobileDestination> destinations;
  final GoRouter router;
  final VoidCallback? onDestinationSelected;
  
  @override
  State<StatefulWidget> createState() => _SidemenuMobileState();
}

class _SidemenuMobileState extends State<SidemenuMobile> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
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