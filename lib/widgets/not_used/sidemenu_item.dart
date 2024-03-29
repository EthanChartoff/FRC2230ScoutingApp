import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:scoute_prime/misc/user_types.dart';

/// [SidemenuItemDesktop] is a widget that builds a button for [DesktopSidemenu]
class SidemenuItemDesktop extends StatefulWidget {
  /// Title of [SidemenuItemDesktop]
  final String title;

  /// Icon of [SidemenuItemDesktop]
  final IconData icon;

  /// Url route to navigate to when tapping on [SidemenuItemDesktop]
  final String route;

  /// Flag that checks when [DesktopSidemenu] is toggled on open or closed
  final bool isExpanded;

  const SidemenuItemDesktop({
    required this.title,
    required this.icon,
    required this.route,
    required this.isExpanded,
    super.key
  });

  @override
  State<StatefulWidget> createState() => _SidemenuItemDesktopState();
}

class _SidemenuItemDesktopState extends State<SidemenuItemDesktop> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
  }

  /// select the color of [SidemenuItemDesktop] when selected, hovered or neither
  Color _setColor() {
    if(_isHovered) {
      return Theme.of(context).hoverColor.withOpacity(0.5);
    }
    return Theme.of(context).primaryColorDark;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      /// Inkwell MUST be wrapped with a Material widget 
      /// (can also be wrapped with some other widget, but must be wrapped)
      child: InkWell(
        /// when hovered over, change is hovered to True
        onHover: (value) => setState(() {
          _isHovered = value;
        }),
        
        /// on tap change url route
        onTap: () => context.go(widget.route),
    
        /// ui of item
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _setColor(),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  widget.icon  
                ),
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
