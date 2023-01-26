import 'package:flutter/material.dart';


class DashboardContainer<T extends Widget> extends StatelessWidget {

  const DashboardContainer({
    required this.children,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  final List<T> children;

  @override
  Widget build(BuildContext context) => Material(
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
          children: children,
        ),
      ),
    ),
  );
}