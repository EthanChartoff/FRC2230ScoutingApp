import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/// get device platform
import 'dart:io' show Platform;
// get if app is running on the World Wide Web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';

import 'package:scoute_prime/desktop_widgets/login/login_page.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches.dart';
import 'package:scoute_prime/desktop_widgets/matches/user_specific/scouter/scouter_matches.dart';
import 'package:scoute_prime/desktop_widgets/side_menu/screen_with_sidemenu.dart';
import 'package:scoute_prime/desktop_widgets/matches/matches_page.dart';
import 'package:scoute_prime/user_type_builder.dart';
import 'package:scoute_prime/variables/constants.dart';
import 'package:scoute_prime/variables/user_types.dart';

void main() {
  /// start the app
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App>{
  UserTypes user = UserTypes.noType;

  /// 
  void updatePermissions(UserTypes permission) {
    setState(() {
      user = permission;
    });
  }

  /// The root [Widget] of the app.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( 
      /// ScreenUtilInit is a plugin that lets the program adapt ui displays and fonts to the screen size.
      /// You can read more about it here: https://pub.dev/packages/flutter_scrflutter_screenutileenutil
      
      /// Configure ScreenUtils screen size so the proportions in other devices will be the same 
      designSize: SCREEN_SIZE,

      builder: ((context, child) => MaterialApp(
        /// MaterialApp is a convenience widget that wraps a number of widgets that are commonly required for Material Design applications.
      
        /// header of the tab in the browser.
        title: '2230 scouting',
    
        theme: ThemeData(
          /// Defines a theme data, we can use the theme data to set app-wide colors, fonts, widgets
          /// that can be used throught the app.

          // colors // 
          primaryColor: ConstColors.PRIMARY_COLOR,
          primaryColorDark: ConstColors.PRIMARY_COLOR_DARK,
          primaryColorLight: ConstColors.PRIMARY_COLOR_LIGHT,

          canvasColor: ConstColors.SECONDERY_COLOR,

          backgroundColor: ConstColors.BACKGROUND_COLOR,

          hoverColor: ConstColors.HOVER_COLOR,

          textTheme: TextTheme(

            /// OngoingMatchCard title style
            headline1: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white
            ),
            subtitle1: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey
            )
          ),
        ),

        color: Theme.of(context).primaryColor,
        
        /// Start the app with the "/" named route. In our case the app starts with LoginScreen.
        initialRoute: '/',
        
        /// Change widgets of routes and/or routes depending on device
        /// and how the application is ran, 
        /// 
        /// computers and phones will have different widget sizes, colors, builds...
        onGenerateRoute: (route) {
          return MaterialPageRoute(
            /// onGenerateRoute need to return a Route, so the buide is wrapped
            /// with MaterialPageRoute
            builder: ((context) {
              if(kIsWeb) {
                /// runs on the web
                
                if(user == UserTypes.noType) {
                  return LoginPage(
                    updatePermissions: updatePermissions,
                  );
                }
                else {
                  if(route.name == '/') {
                  /// user logs in or wants changes type
                  return LoginPage(
                    updatePermissions: updatePermissions,
                  );
                }
                  if(route.name == '/matches') {
                    return UserTypeBuilder(
                      user: user,
                      viewerPage: DesktopSidemenuScreenBuilder(
                        screen: MatchesPage(
                          bodyBuilder: ScoutingMatches.builder,
                        )
                      ),
                      scouterPage: DesktopSidemenuScreenBuilder(
                        screen: MatchesPage(
                          bodyBuilder: ScoutingMatches.builder
                        )
                      ),
                      adminPage: DesktopSidemenuScreenBuilder(
                        screen: MatchesPage(
                          bodyBuilder: ScoutingMatches.builder
                        )
                      ),
                    );
                  }
                }
              }
              return LoginPage(
                updatePermissions: updatePermissions,
              );
            })
          );
        },
      ))
    );
  }
}

