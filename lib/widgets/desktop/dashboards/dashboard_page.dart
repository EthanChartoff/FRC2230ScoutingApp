import 'package:flutter/material.dart';

abstract class DashboardPage extends StatelessWidget {

  const DashboardPage({
    required this.title,
    required this.data,
  });

  /// Page title.
  final String title;

  /// data that can be brought to the page. first value is supposed to be a 
  /// function that returns the data, from there values will be arguments to the
  /// function.
  final Map<String, dynamic> data;

  Widget buildDashboard({
    required BuildContext context,
    required Map<String, dynamic> data,
    required double width,
    Key? key,
  });

  @override
  Widget build(BuildContext context) => ErrorWidget.withDetails(
    message: '''
      Dashboards shouldn't be built with the build function, they should be 
      built with the buildDashboard function.
    '''
  );
}