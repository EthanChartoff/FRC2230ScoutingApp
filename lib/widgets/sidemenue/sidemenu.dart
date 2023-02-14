import 'package:flutter/material.dart';

import 'package:scoute_prime/widgets/sidemenue/sidemenu_item.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/searchboxes.dart';
import 'package:scoute_prime/misc/teams_data.dart';


/// match width to [DesktopSidemenu]s toggled mode
double getCurrWidth(toggleOpen) {
  if(toggleOpen) {
    return 200;
  }
  else{
    return 45;
  }
}

/// Menu thats used by the user for navigating from one screen to another (or [routes] if you want to be exact)
class DesktopSidemenu extends StatefulWidget {
  /// check if [DesktopSidemenu] is toggled on open or compact
  bool toggleOpen = false;

  @override
  State<StatefulWidget> createState() => _DesktopSidemenuState();
}

class _DesktopSidemenuState extends State<DesktopSidemenu> {

  @override
  void initState() {
    super.initState();
  }

  Widget get teamSearchBox {
    if(widget.toggleOpen) {
      return Material(
        child: SizedBox(
          width: double.infinity,
          child: TeamSearchbox(
            context: context,
            teams: TeamsData.israelTeams,
            onTap: () {
              if(widget.toggleOpen != true) {
                setState(() => widget.toggleOpen = true);
              }
            },
            isExpanded: widget.toggleOpen,
          ),
        )
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    Icon? menuIcon;

    return AnimatedContainer(
      //TODO: add stuff like decoration or headers, make menu less dependent on screen size

      constraints: const BoxConstraints(
        minWidth: 35
      ),

      duration: const Duration(milliseconds: 50),
      width: getCurrWidth(widget.toggleOpen),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Theme.of(context).primaryColorDark,
            width: double.infinity,
            height: double.infinity,
          ),
          /// column with all the widgets of the list
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Material(
                  color: Theme.of(context).primaryColorDark,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => setState(() => widget.toggleOpen = !widget.toggleOpen), 
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30,
                    ),
                  ),
                ),
              ),
              DesktopSidemenuItem(
                title: "matches", 
                icon: Icons.airline_seat_flat, 
                route: Routing.MATCHES,
                isExpanded: widget.toggleOpen,
              ),

              DesktopSidemenuItem(
                title: "pick-list", 
                icon: Icons.airline_seat_recline_extra_outlined, 
                route: Routing.PICK_LIST,
                isExpanded: widget.toggleOpen,
              ),
              
              DesktopSidemenuItem(
                title: "all teams", 
                icon: Icons.attach_money, 
                route: Routing.ALL_TEAMS,
                isExpanded: widget.toggleOpen,
              ),

              DesktopSidemenuItem(
                title: "title", 
                icon: Icons.attribution, 
                route: Routing.LOGIN,
                isExpanded: widget.toggleOpen,
              ),
              
              teamSearchBox
            ]
          )
        ]
      ),
    );
  }
}
