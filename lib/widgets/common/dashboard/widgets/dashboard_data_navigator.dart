import 'package:flutter/material.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_column.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_graph.dart';
import 'package:scoute_prime/widgets/common/dashboard/widgets/dashboard_piechart.dart';


class DashboardsDataNav extends StatefulWidget {
  const DashboardsDataNav({
    required this.children,
  });

  final List<Widget> children;

  @override
  State<DashboardsDataNav> createState() => _DashboardsDataNavState();
}

class _DashboardsDataNavState extends State<DashboardsDataNav> {

  int selectedIndex = 0;

  /// Returns a list of nav destinations by theire type. Is supposed to work 
  /// with data data visualization types, so if you give it a child that is not
  /// a data visualization, it will give you a generic nav dest. 
  List<NavigationRailDestination> get _destinationByType => 
    List<NavigationRailDestination>.generate(widget.children.length, (index) {
      switch (widget.children[index].runtimeType) {
        case DashboardGraph:
          return const NavigationRailDestination( 
            icon: Icon(Icons.auto_graph),
            label: Text('graph'),
          );
        case DashboardPiechart:
          return const NavigationRailDestination(
            icon: Icon(Icons.pie_chart),
            label: Text('pie chart'),
          );
        case DashboardColumn:
          return const NavigationRailDestination(
            icon: Icon(Icons.bar_chart),
            label: Text('column chart'),
          );
        default:
          return const NavigationRailDestination(
            icon: Icon(Icons.dashboard),
            label: Text('generic'),
          );
      }
    });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: selectedIndex,
          backgroundColor: Theme.of(context).primaryColorDark,
          destinations: _destinationByType,
          onDestinationSelected: (value) => setState(() {
            selectedIndex = value;
          }),
          useIndicator: true,
        ),
    
        Expanded(
          child: widget.children[selectedIndex],
        )
      ],
    );
  }
}