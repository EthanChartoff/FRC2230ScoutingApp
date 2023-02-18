import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdaptiveDrawer extends Builder {
  AdaptiveDrawer({
    Key? key,
    required GoRouter router,
    required bool bottom,
    required List<Widget> children,

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
            ...children,
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
            ...children,
            ...?trailing,
          ],
        ),
      );
    }
  );
}