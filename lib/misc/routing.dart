import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:scoute_prime/desktop_widgets/login/login_page.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches_page.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/scouter/scouting_form.dart';
import 'package:scoute_prime/desktop_widgets/matches/scouting_forms/strategy/strategy_form.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/scouter/scouter_matches.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/viewer/viewer_matches.dart';
import 'package:scoute_prime/desktop_widgets/sidemenu/screen_with_sidemenu.dart';
import 'package:scoute_prime/desktop_widgets/team_dashboard/dashboard.dart';
import 'package:scoute_prime/misc/custom_page_route.dart';
import 'package:scoute_prime/misc/user_type_builder.dart';
import 'package:scoute_prime/variables/user_types.dart';


/// Handles sub-routes and route names, ([Router] was already taken)
@immutable
class Routing extends StatefulWidget {
  static const LOGIN = '/';
  
  static const MATCHES = '/matches';
  static const MATCHES_SCOUTING_FORM = '$MATCHES/scouting-form'; 

  /// team id needs to be inputed when using route
  static const TEAM_VIEW = '/team-dashboard?team-number=';


  /// route user is in
  final String route;

  const Routing({
    super.key,
    required this.route,
  });


  static RoutingState of(BuildContext context) => 
    context.findAncestorStateOfType<RoutingState>()!;  

  @override
  State<StatefulWidget> createState() => RoutingState();
}

class RoutingState extends State<Routing>{  
  ///
  final _navigatorKey = GlobalKey<NavigatorState>();

  ///
  UserTypes user = UserTypes.noType;


  /// updates user type 
  void updatePermissions(UserTypes permission) {
    setState(() {
      user = permission;
    });
  }

  void _onTapTeamButton() {
    _navigatorKey.currentState!.pushNamed(Routing.MATCHES_SCOUTING_FORM);
  }

  void _pop() {
    _navigatorKey.currentState!.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      //initialRoute: Routing.MATCHES,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    /// if page is of type Widget? or late widget an error appears
    /// TODO: fix page '/' appears before matches 
    /// 
    /// ERROR DEBUGED, initialpage is '/' and url from browser was so match always started with,
    /// so when page started it was always initialized to /, then saw that url was /matches,
    /// so it went there. 
    /// 
    /// for now this is not considered a bug because the user has no type when 
    /// entering, and the login page is displayed.
 
    late Widget page;
    String? route = settings.name;

    if(user == UserTypes.noType || route == Routing.LOGIN) {
      page = LoginPage(
        updatePermissions: updatePermissions
      );
    }

    else if(route!.startsWith(Routing.MATCHES)) {
      //Navigator.pushNamed(context, Routing.MATCHES);
      page = _onMatchesRoutes(settings.name!);
    }

    else if(route.startsWith(Routing.TEAM_VIEW)) {
      page = TeamDashboard(
        teamNumber: route.substring(Routing.TEAM_VIEW.length)
      );
    }

    else {
      throw Exception("unknown route ${settings.name!}");
    }

    return FastPageRoute(
      builder: (context) => page,
      settings: settings
    );
  }
  
  Widget _onMatchesRoutes(String route) {
    /// Matches routes
    if(route == Routing.MATCHES_SCOUTING_FORM) {
      return UserTypeBuilder(
        user: user, 
        viewerPage: const SizedBox.expand(), 
        scouterPage: ScoutingForm(
          exit: _pop,
        ), 
        adminPage: StrategyForm(
          exit: _pop
        )
      );
    }

    else{
      /// Route is parent Route  
      return DesktopSidemenuScreenBuilder(
        screen: UserTypeBuilder(
          user: user, 
          viewerPage: MatchesPage(
            bodyBuilder: ViewerMatches.builder,
            onTapTeamButton: _onTapTeamButton,
          ), 
          scouterPage: MatchesPage(
            bodyBuilder: ScoutingMatches.builder,
            onTapTeamButton: _onTapTeamButton,
          ), 
          adminPage: MatchesPage(
            bodyBuilder: ScoutingMatches.builder,
            onTapTeamButton: _onTapTeamButton,
          )
        ),
      );
    }
    /// no page corresponding to route was found 
    throw Exception('Uknown route $route');
  }
}