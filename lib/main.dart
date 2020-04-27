import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

void main() {
  final columns = 5;
  final rows = 8;

  List<List<String>> _makeData() {
    final List<List<String>> output = [];
    for (int i = 0; i < columns; i++) {
      final List<String> row = [];
      for (int j = 0; j < rows; j++) {
        row.add('T$i : L$j');
      }
      output.add(row);
    }
    return output;
  }

  /// Simple generator for column title
  List<String> _makeTitleColumn() => List.generate(columns, (i) => 'Height $i');

  /// Simple generator for row title
  List<String> _makeTitleRow() => List.generate(rows, (i) => 'Athlete $i');

  runApp(
    TableSimple(
      titleColumn: _makeTitleColumn(),
      titleRow: _makeTitleRow(),
      data: _makeData(),
    ),
  );
}


class TableSimple extends StatelessWidget {
  TableSimple(
      {@required this.data,
      @required this.titleColumn,
      @required this.titleRow});

  final List<List<String>> data;
  final List<String> titleColumn;
  final List<String> titleRow;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('High Jump Results'),
          backgroundColor: Colors.black,
        ),
        body: StickyHeadersTable(
          columnsLength: titleColumn.length,
          rowsLength: titleRow.length,
          columnsTitleBuilder: (i) => Text(titleColumn[i]),
          rowsTitleBuilder: (i) => Text(titleRow[i]),
          contentCellBuilder: (i, j) =>
              Container(height: 50, width: 50, 
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => FocusScope.of(context).requestFocus(),
              )),
          legendCell: Text('Athletes'),
        ),
      ),
    );
  }
}