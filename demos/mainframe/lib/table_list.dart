import 'package:flutter/material.dart';
import 'table_line.dart';

class TableList extends StatelessWidget {
  final List<Map<String, dynamic>> tables;
  final Function onDelete;
  final Function onVerify;
  final Function onInfoChanged;

  TableList({
    required this.tables,
    required this.onDelete,
    required this.onVerify,
    required this.onInfoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tables.length,
      itemBuilder: (context, index) {
        return TableLine(
          tableName: tables[index]['tableName'],
          elegantName: tables[index]['elegantName'],
          capacity: tables[index]['capacity'],
          isChanged: tables[index]['isChanged'],
          onDelete: () => onDelete(index),
          onVerify: () => onVerify(index),
          onInfoChanged: () => onInfoChanged(index),
        );
      },
    );
  }
}