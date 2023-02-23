import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/api/2230_database/dart/get/teams.dart';
import 'package:scoute_prime/widgets/common/builder_wrapper.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/no_team_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/strategy.dart';
import 'package:scoute_prime/widgets/desktop/all_teams/all_teams_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/endgame.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/teleop.dart';
import 'package:scoute_prime/widgets/desktop/login/login_page_desktop.dart';
import 'package:scoute_prime/widgets/common/device_builder.dart';
import 'package:scoute_prime/widgets/common/matches/matches_page.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/scouting_form2023.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/2023/strategy_form_desktop.dart';
import 'package:scoute_prime/widgets/mobile/login/login_page_mobile.dart';
import 'package:scoute_prime/widgets/desktop/pick_list/pick_list_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/dashboard.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/auto.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/user_type_builder.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/misc/user_types.dart';
import 'package:scoute_prime/widgets/mobile/pick_list/pick_list_page.dart';



void main() {
  /// start the app
  runApp(App());
}

// ignore: must_be_immutable
class App extends StatefulWidget {
  
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Permissions of user.
  /// 
  /// pages can change according to a users permission.
  UserTypes _user = UserTypes.noType;

  /// Change pages of routes and/or routes depending on device
  /// and how the application is ran, 
  /// 
  /// computers and phones will have different widget sizes, colors, builds...
  late final _router = GoRouter(

    routes: [
      GoRoute(
        path: Routing.LOGIN,
        builder: (context, state) => DeviceBuilder(
          mobile: LoginPageMobile(
            updatePermissions: (permission) => setState(() {
              _user = permission;
            }),
          ),
          desktop: LoginPageDesktop(
            updatePermissions: (permission) => setState(() {
              _user = permission;
            }),
          ),
          web: LoginPageDesktop(
            updatePermissions: (permission) => setState(() {
              _user = permission;
            }),
          ),
        )
      ),

      GoRoute(
        path: Routing.MATCHES,
        builder: (context, state) => Scaffold(
          /// scaffold is used here to enable snackbars
          body: UserTypeBuilder(
            user: _user, 
            viewerPage: MatchesPage(), 
            scouterPage: MatchesPage(), 
            adminPage: MatchesPage()
          ),
        ),

        routes: [
          GoRoute(
            path: Routing.MATCHES_SCOUTING_FORM,
            builder: (context, state) {
              final matchId = state.queryParams['matchId'] ?? 'noMatchId';
              final teamId = state.queryParams['teamId'] ?? 'noTeamId';
              final alliance = state.queryParams['alliance'] ?? 'noAlliance';
              final matchNum = state.queryParams['matchNum'] ?? 'noMatchNum';

              return UserTypeBuilder(
                user: _user, 
                viewerPage: MatchesPage(),
                scouterPage: ScoutingForm2023(
                  exit: context.pop,
                  matchId: matchId,
                  teamId: teamId,
                  alliance: alliance,
                  matchNum: matchNum,
                ), 
                adminPage: StrategyFormDesktop(
                  exit: context.pop,
                  matchId: matchId,
                  teamId: teamId,
                  alliance: alliance,
                  matchNum: matchNum,
                )
              );
            } 
          ),

          GoRoute(
            path: Routing.MATCHES_DASHBOARD,
            builder: (context, state) {
              final matchKey = state.queryParams['key'] ?? 'noKey';

              return Dashboard(
                teamNumber: 2230,
                matchKey: matchKey,
                dashboardPages: [
                  AutoDashboard2023()
                ],
              );
            },
          )
        ]

      ),

      GoRoute(
        path: Routing.TEAM_DASHBOARD,
        
        builder: (context, state) {
          final teamId = state.queryParams['teamId'];

          if(teamId == null) return const DashboardNoTeamPage();

          final dashboard = [
            AutoDashboard2023(
              teamId: teamId
            ),
            TeleopDashboard2023(
              teamId: teamId
            ),
            EndgameDashboard2023(
              teamId: teamId
            ),
            StrategyDashboard2023(
              teamId: teamId
            )
          ];

          return UserTypeBuilder(
            user: _user, 
            viewerPage: Dashboard(
              teamNumber: int.parse(teamId),
              dashboardPages: dashboard,
            ),
            scouterPage: Dashboard(
              teamNumber: int.parse(teamId),
              matchKey: '2022aroz_f1m1',
              dashboardPages: dashboard,
            ),
            adminPage: Dashboard(
              teamNumber: int.parse(teamId),
              dashboardPages: dashboard,
            )
          );
        }
      ),

      GoRoute(
        path: Routing.PICK_LIST,
        builder: (context, state) => DeviceBuilder(
          mobile: const PickListPageMobile(
            teamsFromDb: GetTeamsData.all,
          ),
          desktop: const PickListPageDesktop(
            teamsFromDb: GetTeamsData.all,
          ),
          web: const PickListPageDesktop(
            teamsFromDb: GetTeamsData.all,
          ),
        )        
      ),

      GoRoute(
        path: Routing.ALL_TEAMS,
        builder: (context, state) => const AllTeamsPage()
      )
    ],

    redirect: (context, state) {
      if(state.location != Routing.LOGIN && _user == UserTypes.noType) return Routing.LOGIN;
    },

    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('404 - Page not found'),
      ),
    )
  );

    /// The root [Widget] of the app.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit( 
      /// ScreenUtilInit is a plugin that lets the program adapt ui displays and fonts to the screen size.
      /// You can read more about it here: https://pub.dev/packages/flutter_scrflutter_screenutileenutil
      
      /// Configure ScreenUtils screen size so the proportions in other devices will be the same 
      designSize: SCREEN_SIZE,

      builder: ((context, child) => MaterialApp.router(
        /// MaterialApp is a convenience widget that wraps a number of widgets that are commonly required for Material Design applications.
      
        /// header of the tab in the browser.
        title: '2230 scouting',
    
        theme: ThemeData(
          /// Defines a theme data, we can use the theme data to set app-wide colors, fonts, widgets
          /// that can be used throught the app.

          /// # Colors #
          primaryColor: ConstColors.PRIMARY_COLOR,
          primaryColorDark: ConstColors.PRIMARY_COLOR_DARK,
          primaryColorLight: ConstColors.PRIMARY_COLOR_LIGHT,

          colorScheme: const ColorScheme(
            primary: ConstColors.PRIMARY_COLOR,
            secondary: ConstColors.SECONDARY_COLOR,
            surface: ConstColors.PRIMARY_COLOR,
            background: ConstColors.BACKGROUND_COLOR,
            error: Colors.red,
            onPrimary: ConstColors.PRIMARY_COLOR,
            onSecondary: ConstColors.PRIMARY_COLOR,
            onSurface: ConstColors.PRIMARY_COLOR,
            onBackground: ConstColors.PRIMARY_COLOR,
            onError: Colors.red,
            brightness: Brightness.light,
          ),

          canvasColor: Colors.transparent,

          backgroundColor: ConstColors.BACKGROUND_COLOR,

          hoverColor: ConstColors.HOVER_COLOR,

          textTheme: TextTheme(

            /// ## title styles ## 
            headline1: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white,
            ),
            subtitle1: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey
            ),

            /// ## OngoingMatchCard buttons body style ##
            bodyText1: GoogleFonts.roboto(
              fontSize: 16,
              color: ConstColors.RED_TEAM_COLOR
            ),
            bodyText2: GoogleFonts.roboto(
              fontSize: 16,
              color: ConstColors.BLUE_TEAM_COLOR
            ),

            /// ## Matches page tile of state above each type of cards ##
            headline2: const TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: 'GalacticVanguardian'
            ),

            /// ## Scouting form page textStyles ##
            headline3: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.grey[400],
            ),
          ),

          cardTheme: CardTheme(
            color: Theme.of(context).primaryColorDark,
            elevation: 10,
            margin: const EdgeInsets.all(8)
          )
        ),

        color: Theme.of(context).primaryColor,

        /// used to wrap your route-widgets with a parent widget.
        /// https://stackoverflow.com/a/56430445
        builder: (context, child) => Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (context) => BuilderWrapper(
                router: _router,
                child: child,
              )
            )
          ],
        ),

        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      ))
    );
  }
}

