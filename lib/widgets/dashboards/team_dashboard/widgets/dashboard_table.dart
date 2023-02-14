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
        print(cell);
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cell.substring(cell == '' ? 0 : cell.length - 1) == '%' ? 
                '${(double.parse(cell.replaceAll('%', '')) * 100).toString()
                    .substring(0, cell.length < 5 ? cell.length - 1 : 5)}%' : cell,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: lerpValues && cell.substring(cell == '' ? 0 : cell.length - 1) == '%' ? 
                  Color.lerp(
                    Colors.redAccent, 
                    Colors.lightGreen,
                    double.parse(cell.replaceAll('%', ''))
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