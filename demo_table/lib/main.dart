import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Table {
  final String id;
  String table_status;

  Table({required this.id, this.table_status = 'Available'});
}

class TableList {
  final List<Table> tables;

  TableList({required this.tables});
}

class TableCategory {
  final int id;
  final String category_id;
  final String name;
  final TableList table_list;

  TableCategory({
    required this.id,
    required this.category_id,
    required this.name,
    required this.table_list,
  });
}

class TableCategoryList {
  final List<TableCategory> tableCategories;

  TableCategoryList({required this.tableCategories});
}

Future<TableCategoryList> getTableCategory() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:3000/table_category_all'));

    print('getTableCategory ... ... ');
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<TableCategory> tableCategories = [];

      for (var category in data) {
        print('category: $category');
        final String categoryId = category['category_id']?.toString() ?? ''; // Handle null value and ensure String type

        tableCategories.add(TableCategory(
          id: category['id'] ?? 0, // Handle null value
          name: category['name'] ?? 'Unknown', // Handle null value
          category_id: categoryId,
          table_list: TableList(tables: await tablesFromCategory(categoryId)),
        ));
      }
      return TableCategoryList(tableCategories: tableCategories);
    } else {
      throw Exception('Failed to load table categories');
    }
  } catch (e) {
    print('Error in getTableCategory: $e');
    throw Exception('Failed to load table categories');
  }
}

Future<List<Table>> tablesFromCategory(String categoryId) async {
  try {
    print('tablesFromCategory called with categoryId: $categoryId');
    final response = await http.get(Uri.parse('http://localhost:3000/tables?category_id=$categoryId'));

    print('tablesFromCategory ... ... ');
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Table> tables = [];
      for (var table in data) {
        tables.add(Table(
          id: table['id']?.toString() ?? '', // Handle null value and ensure String type
          table_status: table['table_status'] ?? 'Available', // Handle null value
        ));
      }

      print(tables);

      return tables;
    } else {
      throw Exception('Failed to load tables for category $categoryId');
    }
  } catch (e) {
    print('Error in tablesFromCategory: $e');
    throw Exception('Failed to load tables for category $categoryId');
  }
}

class DinningTable extends StatefulWidget {
  final List<TableCategory> tableCategories;

  DinningTable({required this.tableCategories});

  @override
  _DinningTableState createState() => _DinningTableState();
}

class _DinningTableState extends State<DinningTable> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemSize = screenWidth / 8;

    return Scaffold(
      appBar: AppBar(
        title: Text('桌台管理'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              print('onPressed()');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.tableCategories.length,
        itemBuilder: (context, categoryIndex) {
          var category = widget.tableCategories[categoryIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  category.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: category.table_list.tables.length,
                itemBuilder: (context, tableIndex) {
                  var table = category.table_list.tables[tableIndex];
                  return GestureDetector(
                    onTap: () {
                      print('onTap().');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Table ${table.id}',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              table.table_status,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class DinningTablesPage extends StatefulWidget {
  @override
  _DinningTablesPageState createState() => _DinningTablesPageState();
}

class _DinningTablesPageState extends State<DinningTablesPage> {
  bool _isLoading = true;
  TableCategoryList? _tableCategoryList;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchTableCategories();
  }

  Future<void> _fetchTableCategories() async {
    try {
      final tableCategoryList = await getTableCategory();
      setState(() {
        _tableCategoryList = tableCategoryList;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dinning Tables'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text('Failed to load table categories. Please try again later.'))
              : DinningTable(tableCategories: _tableCategoryList!.tableCategories),
    );
  }
}

void handleDinningTablePressed(BuildContext context) {
  print('Dinning Table Icon pressed');
  try {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DinningTablesPage()),
    ).then((_) {
      print('Navigation to DinningTablesPage completed');
    });
  } catch (e) {
    print('Error during navigation: $e');
  }
}

void main() {
  runApp(MaterialApp(
    home: DinningTablesPage(),
  ));
}