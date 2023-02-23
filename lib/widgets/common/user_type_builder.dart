import 'package:flutter/material.dart';
import 'package:scoute_prime/misc/user_types.dart';

/// Builds a page according to the users perms, made
/// so [MaterialApp.onGenerateRoute] is more organized
class UserTypeBuilder extends Builder {
  
  UserTypeBuilder({
    required this.user,
    required this.viewerPage,
    required this.scouterPage,
    required this.adminPage
  }) : super(
    builder: (context) {
      switch (user) {
        case UserTypes.Viewer:
          return viewerPage;
        case UserTypes.Scouter:
          return scouterPage;
        case UserTypes.Strategy:
          return adminPage;
        default:
          return ErrorWidget(
            'user doesnt have permisisons to go here'
          );
      }
    }
  );

  /// The current user that is using the application, 
  /// its type will determine what page is built
  final UserTypes user;

  /// if [user] = [UserTypes.Viewer], build this widget,
  final Widget viewerPage;

  /// if [user] = [UserTypes.Scouter], build this widget,
  final Widget scouterPage;

  /// if [user] = [UserTypes.Strategy], build this widget,
  final Widget adminPage;
}