import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:scoute_prime/misc/routing.dart';

class AdaptiveDrawer extends Builder {
  AdaptiveDrawer({
    Key? key,
    required GoRouter router,
    required bool bottom,

    List<Widget>? children,
    List<Widget>? leading,
    List<Widget>? trailing,

    VoidCallback? onDestinationSelected,
    VoidCallback? onDestinationUnselected,    
  }) : super(
    key: key,
    builder: (context) {
      return bottom ? 
      Container(
        height: 300,
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          children: [
            ...?leading,
            ...children ?? [
              ListTile(
                leading: const Icon(Icons.airline_seat_flat),
                title: const Text('Matches'),
                onTap: () {
                  router.go(Routing.MATCHES);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.airline_seat_recline_extra_outlined),
                title: const Text('Pick List'),
                onTap: () {
                  router.go(Routing.PICK_LIST);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('All Teams'),
                onTap: () {
                  router.go(Routing.ALL_TEAMS);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attribution),
                title: const Text('Login'),
                onTap: () {
                  router.go(Routing.LOGIN);
                  onDestinationSelected?.call();
                },
              ),
            ],
            ...?trailing,
          ],
        )
      )
      :
      Container(
        width: 400,
        color: Theme.of(context).primaryColorDark,
        child: ListView(
          children: [
            ...?leading,
            ...children ?? [
              ListTile(
                leading: const Icon(Icons.airline_seat_flat),
                title: const Text('Matches'),
                onTap: () {
                  router.go(Routing.MATCHES);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.airline_seat_recline_extra_outlined),
                title: const Text('Pick List'),
                onTap: () {
                  router.go(Routing.PICK_LIST);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_money),
                title: const Text('All Teams'),
                onTap: () {
                  router.go(Routing.ALL_TEAMS);
                  onDestinationSelected?.call();
                },
              ),
              ListTile(
                leading: const Icon(Icons.attribution),
                title: const Text('Login'),
                onTap: () {
                  router.go(Routing.LOGIN);
                  onDestinationSelected?.call();
                },
              ),
            ],
            ...?trailing,
          ],
        ),
      );
    }
  );
}