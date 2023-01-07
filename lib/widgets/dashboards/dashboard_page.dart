import 'package:flutter/material.dart';

abstract class DashboardPage extends StatelessWidget {

  const DashboardPage({
    required this.title
  });

  /// Page title.
  final String title;

  Widget buildDashboard({
    required BuildContext context,
    required data
  });

  @override
  Widget build(BuildContext context) => ErrorWidget.withDetails(
    message: '''
      Dashboards shouldn't be built with the build function, they should be 
      built with the buildDashboard function.
    '''
  );
}