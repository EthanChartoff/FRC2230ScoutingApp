import 'package:flutter/material.dart';
import 'package:scoute_prime/widgets/dashboards/team_dashboard/widgets/dashboard_data_navigator.dart';


class DashboardContainer<T extends Widget> extends StatelessWidget {

  const DashboardContainer({
    required this.children,
    this.width,
    this.height,
    this.title
  });

  final double? width;
  final double? height;

  /// Children will have a key (representing the page) and a value (all the
  /// different ways to display data).
  final Map<String, List<T>> children;

  final String? title;

  @override
  Widget build(BuildContext context) {    
    return Material(
      color: Theme.of(context).backgroundColor,
      elevation: 20,
      borderRadius: BorderRadius.circular(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: height,
          width: width,
          color: Theme.of(context).primaryColorDark,
          child: PageView(
            children: List.generate(children.length, (index) => 
              children.values.toList()[index].length == 1 ? 
                children.values.toList()[index][0] :
              DashboardsDataNav(
                children: children.values.toList()[index],
              )
            ),
          ),
        ),
      ),
    );
  }
}
  