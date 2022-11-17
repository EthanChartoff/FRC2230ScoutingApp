import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/// get device platform
import 'dart:io' show Platform;
// get if app is running on the World Wide Web
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'package:scoute_prime/custom_page_route.dart';

import 'package:scoute_prime/desktop_widgets/login/login_page.dart';
import 'package:scoute_prime/routing.dart';
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

          /// # Colors #
          primaryColor: ConstColors.PRIMARY_COLOR,
          primaryColorDark: ConstColors.PRIMARY_COLOR_DARK,
          primaryColorLight: ConstColors.PRIMARY_COLOR_LIGHT,

          canvasColor: ConstColors.SECONDERY_COLOR,

          backgroundColor: ConstColors.BACKGROUND_COLOR,

          hoverColor: ConstColors.HOVER_COLOR,

          /// # Text Themes (if it wasnt obvious) #
          textTheme: TextTheme(

            /// OngoingMatchCard title style
            headline1: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.white
            ),
            subtitle1: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey
            ),

            /// OngoingMatchCard buttons body style
            bodyText1: GoogleFonts.roboto(
              fontSize: 16,
              color: ConstColors.RED_TEAM_COLOR
            ),
            bodyText2: GoogleFonts.roboto(
              fontSize: 16,
              color: ConstColors.BLUE_TEAM_COLOR
            ),

            /// Matches page tile of state above each type of cards
            headline2: const TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontFamily: 'GalacticVanguardian'
            ),
          ),
        ),

        color: Theme.of(context).primaryColor,
        
        /// Start the app with the "/" named route. In our case the app starts with LoginScreen.
        initialRoute: Routing.LOGIN,
        
        /// Change pages of routes and/or routes depending on device
        /// and how the application is ran, 
        /// 
        /// computers and phones will have different widget sizes, colors, builds...
        onGenerateRoute: (RouteSettings settings) => FastPageRoute(
          builder: (context) => Routing(
            route: settings.name!
          ),
          settings: settings
        )
      ))
    );
  }
}

