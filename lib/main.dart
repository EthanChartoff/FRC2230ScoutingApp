import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scoute_prime/api/2230_database/dart/get/teams.dart';
import 'package:scoute_prime/widgets/common/builder_wrapper.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard_page.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/2023/mobile/strategy_form_mobile.dart';
import 'package:scoute_prime/widgets/common/matches/matches_page_strategy.dart';
import 'package:scoute_prime/widgets/common/dashboard/no_team_page.dart';
import 'package:scoute_prime/widgets/desktop/all_teams/all_teams_page.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/endgame.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/strategy_match_comments.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/teleop.dart';
import 'package:scoute_prime/widgets/desktop/login/login_page_desktop.dart';
import 'package:scoute_prime/widgets/common/device_builder.dart';
import 'package:scoute_prime/widgets/common/matches/matches_page_scouting.dart';
import 'package:scoute_prime/widgets/common/matches/forms/scouter/scouting_form2023.dart';
import 'package:scoute_prime/widgets/common/matches/forms/strategy/2023/desktop/strategy_form_desktop.dart';
import 'package:scoute_prime/widgets/mobile/dashboards/team_dashboard/2023/pages/endgame.dart';
import 'package:scoute_prime/widgets/mobile/dashboards/team_dashboard/2023/pages/strategy_match_comments.dart';
import 'package:scoute_prime/widgets/mobile/dashboards/team_dashboard/2023/pages/strategy_no_match_comments.dart';
import 'package:scoute_prime/widgets/mobile/dashboards/team_dashboard/2023/pages/teleop.dart';
import 'package:scoute_prime/widgets/mobile/login/login_page_mobile.dart';
import 'package:scoute_prime/widgets/desktop/pick_list/pick_list_page.dart';
import 'package:scoute_prime/widgets/common/dashboard/dashboard.dart';
import 'package:scoute_prime/widgets/desktop/dashboards/team_dashboard/2023/pages/auto.dart';
import 'package:scoute_prime/misc/routing.dart';
import 'package:scoute_prime/widgets/common/user_type_builder.dart';
import 'package:scoute_prime/misc/constants.dart';
import 'package:scoute_prime/misc/user_types.dart';
import 'package:scoute_prime/widgets/mobile/pick_list/pick_list_page_scouting.dart';
import 'package:scoute_prime/widgets/mobile/pick_list/pick_list_page_strategy.dart';

import 'widgets/mobile/dashboards/team_dashboard/2023/pages/auto.dart';



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
        )
      ),

      GoRoute(
        path: Routing.MATCHES,
        builder: (context, state) => Scaffold(
          /// scaffold is used here to enable snackbars
          body: UserTypeBuilder(
            user: _user, 
            viewerPage: MatchesPageScouting(), 
            scouterPage: MatchesPageScouting(), 
            adminPage: MatchesPageStrategy()
          ),
        ),

        routes: [
          GoRoute(
            path: Routing.MATCHES_SCOUTING_FORM,
            builder: (context, state) {
              final relatedToMatch = state.queryParams['match']
                == 'true' ? true : false;
              final teamId = state.queryParams['teamId'] ?? 'noTeamId';
              
              final matchId = state.queryParams['matchId'];
              final alliance = state.queryParams['alliance'];
              final matchNum = state.queryParams['matchNum'];

              if(relatedToMatch) {
                return UserTypeBuilder(
                  user: _user, 
                  viewerPage: MatchesPageScouting(),
                  scouterPage: ScoutingForm2023(
                    exit: context.pop,
                    matchId: matchId ?? 'noMatchId',
                    teamId: teamId,
                    alliance: alliance ?? 'noAlliance',
                    matchNum: matchNum ?? 'noMatchNum',
                  ), 
                  adminPage: DeviceBuilder(
                    desktop: StrategyFormDesktop(
                      relatedToMatch: relatedToMatch,
                      exit: context.pop,
                      matchId: matchId,
                      teamId: teamId,
                      alliance: alliance,
                      matchNum: matchNum,
                    ),
                    mobile: StrategyFormMobile(
                      relatedToMatch: relatedToMatch,
                      exit: context.pop,
                      matchId: matchId,
                      teamId: teamId,
                      alliance: alliance,
                      matchNum: matchNum,
                    ),
                  )
                );
              } 
              else {
                return UserTypeBuilder(
                  user: _user, 
                  viewerPage: MatchesPageScouting(),
                  scouterPage: ScoutingForm2023(
                    exit: context.pop,
                    teamId: teamId,
                    matchId: matchId ?? 'noMatchId',
                    alliance: alliance ?? 'noAlliance',
                    matchNum: matchNum ?? 'noMatchNum',
                  ), 
                  adminPage: DeviceBuilder(
                    desktop: StrategyFormDesktop(
                      relatedToMatch: relatedToMatch,
                      exit: context.pop,
                      teamId: teamId,
                    ),
                    mobile: StrategyFormMobile(
                      relatedToMatch: relatedToMatch,
                      exit: context.pop,
                      teamId: teamId,
                    ),
                  )
                );
              }
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
                  AutoDashboardMobile2023()
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

          final dashboardDesktop = [
            AutoDashboardDesktop2023(
              teamId: teamId
            ),
            TeleopDashboardDesktop2023(
              teamId: teamId
            ),
            EndgameDashboardDesktop2023(
              teamId: teamId
            ),
            StrategyDashboardDesktop2023(
              teamId: teamId
            )
          ];

          final dashboardMobile = [
            AutoDashboardMobile2023(
              teamId: teamId
            ),
            TeleopDashboardMobile2023(
              teamId: teamId
            ),
            EndgameDashboardMobile2023(
              teamId: teamId
            ),
            StrategyDashboardMobile2023(
              teamId: teamId
            ),
            StrategyNoMatchDashboardMobile2023(
              teamId: teamId
            )
          ];

          return UserTypeBuilder(
            user: _user, 
            viewerPage: Dashboard(
              teamNumber: int.parse(teamId),
              dashboardPages: dashboardMobile,
            ),
            scouterPage: DeviceBuilder(
              desktop: Dashboard(
                teamNumber: int.parse(teamId),
                dashboardPages: dashboardDesktop.getRange(0, 3).toList(),
              ),
              mobile: Dashboard(
                teamNumber: int.parse(teamId),
                dashboardPages: dashboardMobile.getRange(0, 3).toList(),
              ),
            ), 
            adminPage: DeviceBuilder(
              desktop: Dashboard(
                teamNumber: int.parse(teamId),
                dashboardPages: dashboardDesktop,
              ),
              mobile: Dashboard(
                teamNumber: int.parse(teamId),
                dashboardPages: dashboardMobile,
              ),
            )
          );
        }
      ),

      GoRoute(
        path: Routing.PICK_LIST,
        builder: (context, state) => DeviceBuilder(
          mobile: UserTypeBuilder(
            user: _user, 
            viewerPage: const PickListPageScoutingMobile(
              teamsFromDb: GetTeamsData.all,
            ),
            scouterPage: const PickListPageScoutingMobile(
              teamsFromDb: GetTeamsData.all,
            ),
            adminPage: const PickListPageStrategyMobile(
              teamsFromDb: GetTeamsData.all,
            ),
            
          ),
          desktop: const PickListPageDesktop(
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

        /// Localizations are used to translate the app to different languages.
        /// https://docs.flutter.dev/development/accessibility-and-localization/internationalization
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('he', 'IL'),
    
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

