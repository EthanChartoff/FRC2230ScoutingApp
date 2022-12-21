import 'package:flutter/material.dart';
import 'package:scoute_prime/variables/user_types.dart';

/// Builds a page according to the users perms, made
/// so [MaterialApp.onGenerateRoute] is more organized
class UserTypeBuilder extends StatelessWidget {
  
  /// The current user that is using the application, 
  /// its type will determine what page is built
  final UserTypes user;

  /// if [user] = [UserTypes.Viewer], build this widget,
  final Widget viewerPage;

  /// if [user] = [UserTypes.Scouter], build this widget,
  final Widget scouterPage;

  /// if [user] = [UserTypes.Admin], build this widget,
  final Widget adminPage;

  
  const UserTypeBuilder({
    required this.user,
    required this.viewerPage,
    required this.scouterPage,
    required this.adminPage
  });
  
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: ((context) {
        if(user == UserTypes.Admin) {
          return adminPage;
        }
        else if(user == UserTypes.Scouter) {
          return scouterPage;
        }
        else if(user == UserTypes.Viewer) {
          return viewerPage;
        }
        throw Exception("user doesnt have permisisons to go here");
        /// TODO: implement what to do when user is notype
      })
    );
  }
}