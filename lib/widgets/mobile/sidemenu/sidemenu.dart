import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/widgets/mobile/sidemenu/sidemenu_destination.dart';

class SidemenuMobile extends StatefulWidget {
   const SidemenuMobile({
    Key? key,
    required this.destinations,
    required this.router,
    this.onDestinationSelected,
    this.onDestinationUnselected,
    this.onSwipeUp,
  }) : super(
    key: key,
  );

  final List<SidemenuMobileDestination> destinations;
  final GoRouter router;

  final VoidCallback? onDestinationSelected;
  final VoidCallback? onDestinationUnselected;
  final VoidCallback? onSwipeUp;
  
  @override
  State<StatefulWidget> createState() => _SidemenuMobileState();
}

class _SidemenuMobileState extends State<SidemenuMobile> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if(details.delta.dy < -10) {
          /// On swipe up
          widget.onSwipeUp?.call();
        }
      },
      child: NavigationBar(
        backgroundColor: Theme.of(context).primaryColorDark,
    
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
            widget.destinations[value].route != null ? 
              widget.router.go(widget.destinations[value].route!) : null;
          });
         
          widget.onDestinationSelected?.call();
          widget.destinations[value].onSelected?.call();
        },
    
        destinations: widget.destinations,
      ),
    );
  }
}