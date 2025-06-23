import 'package:flutter/material.dart';

class TableLine extends StatefulWidget {
  final String tableName;
  final String elegantName;
  final int capacity;
  final bool isChanged;
  final Function onDelete;
  final Function onVerify;
  final Function onInfoChanged;

  TableLine({
    required this.tableName,
    required this.elegantName,
    required this.capacity,
    required this.isChanged,
    required this.onDelete,
    required this.onVerify,
    required this.onInfoChanged,
  });

  @override
  _TableLineState createState() => _TableLineState();
}

class _TableLineState extends State<TableLine> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(widget.tableName)),
        Expanded(child: Text(widget.elegantName)),
        Expanded(child: Text(widget.capacity.toString())),
        widget.isChanged
            ? IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  widget.onVerify();
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.onDelete();
                },
              ),
      ],
    );
  }
}