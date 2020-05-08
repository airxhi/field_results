import 'package:flutter/material.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

final columns = 5;
final rows = 8;

void main() {

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

  // Simple generator for focus nodes
  List<List<FocusNode>> _makeNodes() => List.generate(columns, (i) => List.generate(rows, (j) => FocusNode()));

  runApp(
    TableSimple(
      titleColumn: _makeTitleColumn(),
      titleRow: _makeTitleRow(),
      data: _makeData(),
      focusNodes: _makeNodes(),
    ),
  );
}



class TableSimple extends StatelessWidget {
  TableSimple(
      {@required this.data,
      @required this.titleColumn,
      @required this.titleRow,
      @required this.focusNodes});

  final List<List<String>> data;
  final List<List<FocusNode>> focusNodes;
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
                //keyboardType: TextInputType.number,
                //autofocus: true,
                readOnly: true,
                textInputAction: TextInputAction.next,
                focusNode: focusNodes[i][j],
                onSubmitted: (_) => focusNodes[i+((j+1)/rows).floor()][(j+1)%rows].requestFocus(), //FocusScope.of(context).requestFocus(),
              )),
          legendCell: Text('Athletes'),
        ),
      ),
    );
  }
}