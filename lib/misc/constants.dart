import 'package:flutter/material.dart' 
  show Color, Icon, Icons, NavigationDestination, Size;


// All colors in use
class ConstColors {
  static const PRIMARY_COLOR = Color(0xff3d5a80);
  static const PRIMARY_COLOR_DARK = Color(0xff2b2d42);
  static const PRIMARY_COLOR_LIGHT = Color.fromARGB(255, 69, 164, 241);
  static const SECONDARY_COLOR = Color.fromARGB(127, 219, 226, 239);
  static const HOVER_COLOR = Color.fromARGB(213, 187, 227, 251);
  static const BACKGROUND_COLOR = Color(0xff334d70);
  
  static const RED_TEAM_COLOR = Color(0xffff5733);
  static const BLUE_TEAM_COLOR = Color.fromARGB(255, 0, 89, 255);

  static const CONE_COLOR = Color.fromARGB(255, 236, 216, 32);
  static const ON_CONE_COLOR = Color.fromARGB(255, 236, 215, 132);

  static const CUBE_COLOR = Color.fromARGB(255, 156, 13, 192);
  static const ON_CUBE_COLOR = Color.fromARGB(255, 156, 113, 192);
}

const SCREEN_SIZE = Size(
  /* width */ 1920,
  /* height */ 922
);

const List<String> StrategyCategories2023 = [
  'Gathering',
  'Cargo',
  'Scoring',
  'Defence On Other Robots',
  'Defence On Themselves',
  'Drivers',
  'Comments'
];

