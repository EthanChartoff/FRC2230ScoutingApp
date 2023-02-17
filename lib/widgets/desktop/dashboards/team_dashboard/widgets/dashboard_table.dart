import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardTable extends Table {
  DashboardTable({
    Key? key,
    required List<TableRow> children,
    TableBorder? border,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Decoration? decoration,
    Map<int, TableColumnWidth>? columnWidths,
    super.defaultVerticalAlignment,
    super.defaultColumnWidth,
  }) : super(
    key: key,
    children: children,
    border: border,
    textDirection: textDirection,
    textBaseline: textBaseline,
    columnWidths: columnWidths,
  );

  DashboardTable.textTable({
    Key? key,
    required List<List<String>> children,
    bool lerpValues = false,
    TableBorder? border,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    Decoration? decoration,
    Map<int, TableColumnWidth>? columnWidths,
    super.defaultVerticalAlignment,
    super.defaultColumnWidth,
  }) :
  super(
    key: key,
    children: children.map((row) => TableRow(
      children: row.map((cell) {
        final cel = cell.split('%');
        /// only needed if cel had a %
        final parsedCel = cel.length > 1 ? (double.parse(cel.first) * 100).toString() 
        : null;
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              parsedCel != null ? 
                '${parsedCel.substring(0, parsedCel.length > 5 ? 5 : parsedCel.length)}%' : cel.first,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: lerpValues && cel.length > 1 ? 
                  Color.lerp(
                    Colors.redAccent, 
                    Colors.lightGreen,
                    double.parse(cel.first)
                  ) 
                  : Colors.white
              ),
            ),
          ),
        );}).toList(),
    )).toList(),
    border: border,
    textDirection: textDirection,
    textBaseline: textBaseline,
    columnWidths: columnWidths,
  );
}