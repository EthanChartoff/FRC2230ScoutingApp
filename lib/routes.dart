import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoute_prime/custom_page_route.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches_page.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/scouter/scouter_matches.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/strategy/strategy_matches.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/viewer/viewer_matches.dart';
import 'package:scoute_prime/desktop_widgets/side_menu/screen_with_sidemenu.dart';
import 'package:scoute_prime/user_type_builder.dart';
import 'package:scoute_prime/variables/user_types.dart';


/// Handles sub-routes and route names, ([Router] was already taken)
class Routing extends StatefulWidget {
  static const LOGIN = '/';
  
  static const MATCHES = '/matches';
  static const MATCHES_SCOUTING_FORM = '$MATCHES/scouting-form'; 

  /// Have user permissions so router knows what page to load 
  final UserTypes user;

  /// route from where entered, for example:
  /// 
  /// /matches/scouting, initialRoute = /matches
  final String initialRoute;

  /// route to where entering, for example:
  /// 
  /// /matches/scouting, initialRoute = /scouting
  final String subRoute;

  const Routing({
    super.key,
    required this.user,
    required this.initialRoute,
    required this.subRoute
  });

  @override
  State<StatefulWidget> createState() => _RoutesState();
}

class _RoutesState extends State<Routing>{  
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return Navigator(
      key: navigatorKey,
      initialRoute: widget.initialRoute,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    /// if page is of type Widget? or late widget an error appears
    /// TODO: fix page '/' appears before matches
    Widget page = Container();

    if(settings.name!.startsWith(Routing.MATCHES)) {
      page = _onMatchesRoutes(settings.name!);
    }

    return FastPageRoute(
      builder: (context) => page,
      settings: settings
    );
  }
  
  Widget _onMatchesRoutes(String route) {
    /// Matches route
    switch(route) {
      default:
        /// Route is parent Route  
        return DesktopSidemenuScreenBuilder(
          screen: UserTypeBuilder(
            user: widget.user, 
            viewerPage: MatchesPage(
              bodyBuilder: ViewerMatches.builder
            ), 
            scouterPage: MatchesPage(
              bodyBuilder: ScoutingMatches.builder,
            ), 
            adminPage: MatchesPage(
              bodyBuilder: StrategyMatches.builder,
            )
          ),
        );
    }
    /// no page corresponding to route was found 
    throw Exception('Uknown route $route');
  }
}