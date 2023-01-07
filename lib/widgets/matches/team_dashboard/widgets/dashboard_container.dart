import 'package:flutter/material.dart';


class DashboardContainer extends StatelessWidget {

  const DashboardContainer({
    this.width,
    this.height,
    this.child
  });

  final double? width;
  final double? height;

  final Widget? child;

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
        child: child,
      ),
    ),
  );
}