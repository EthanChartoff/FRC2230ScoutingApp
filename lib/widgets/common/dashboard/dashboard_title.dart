import 'dart:math';

import 'package:flutter/material.dart';

class DashboardTitle extends StatefulWidget {
  const DashboardTitle({
    required this.title,
    this.filters,
    this.subtitle,
    this.onTap,
  });

  final String title;
  
  final Widget? filters;
  final String? subtitle;
  final VoidCallback? onTap;

  @override
  State<DashboardTitle> createState() => _DashboardTitleState();
}

class _DashboardTitleState extends State<DashboardTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 550,
                child: Text('${widget.title}${widget.subtitle != null ? ' - ${widget.subtitle}' : ''}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),

            SizedBox(
              width: max(MediaQuery.of(context).size.width - 950, 0),
            ),

            widget.filters ?? const SizedBox.shrink(),  
          ],
        ),
      ),
    );
  }
}