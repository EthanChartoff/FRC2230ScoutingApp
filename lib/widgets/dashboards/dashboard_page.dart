import 'package:flutter/material.dart';

abstract class DashboardPage extends StatelessWidget {

  const DashboardPage({
    required this.title,
    this.data,
  });

  /// Page title.
  final String title;

  final Map<String, dynamic Function()>? data;

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