import 'package:flutter/material.dart';

/// Displays a [TextButton] with a teams number, and redirect the user
/// to another page when pressed. 
class TeamButton extends StatelessWidget {
  /// Context of parent for navigator
  final BuildContext parentContext;

  /// Team id number
  final String teamNumber;

  /// Route to redirect user to 
  final String route;

  /// Color of team
  final TextStyle textStyle; 

  /// Size of button
  final double? width;
  final double? height;
  
  const TeamButton({
    required this.parentContext,
    required this.teamNumber,
    required this.route,
    required this.textStyle,
    
    this.width,
    this.height
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, route),

        style: TextButton.styleFrom(
          backgroundColor: Theme.of(parentContext).primaryColorDark 
        ),

        child: Text(teamNumber,
          style: textStyle
        ),
      ),
    );
  }
}