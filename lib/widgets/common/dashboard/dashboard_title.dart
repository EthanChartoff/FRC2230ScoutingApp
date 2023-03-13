import 'dart:math';

import 'package:flutter/material.dart';

class DashboardTitle extends StatefulWidget {
  const DashboardTitle({
    required this.title,
    this.matches,
    this.filters,
    this.subtitle,
    this.onTap,
  });

  final String title;

  final List<dynamic>? matches;
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
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 550,
                child: Text(
                  '${widget.title}${widget.subtitle != null ? ' - ${widget.subtitle}' : ''}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            SizedBox(
              width: max(MediaQuery.of(context).size.width - 950, 0),
            ),
            widget.matches != null
                ? SizedBox(
                    width: 400,
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.matches!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              widget.matches![index]['matchNumber'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            widget.filters ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
