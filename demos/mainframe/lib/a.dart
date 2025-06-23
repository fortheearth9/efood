import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pinyin/pinyin.dart';

class DinningTableSettings extends StatefulWidget {
  @override
  _DinningTableSettingsState createState() => _DinningTableSettingsState();
}

class _DinningTableSettingsState extends State<DinningTableSettings> {
  List<TableCategory> _tableCategories = [];
  List<Table> _tables = [];
  TableCategory? _selectedCategory;
  final Map<int, TextEditingController> _nameControllers = {};
  final Map<int, TextEditingController> _elegantNameControllers = {};
  final Map<int, TextEditingController> _capacityControllers = {};

  @override
  void initState() {
    super.initState();
    _fetchTableCategories();
    _fetchTables();
  }

  Future<void> _fetchTableCategories() async {
    final response = await http.get(Uri.parse('http://localhost:3000/table_category_all'));
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<TableCategory> categories = data
          .map((item) => TableCategory.fromJson(item))
          .toList();
      setState(() {
        _tableCategories = categories;
        if (_tableCategories.isNotEmpty) {
          _selectedCategory = _tableCategories.first;
        }
      });
    } else {
      throw Exception('Failed to load table categories: $statusCode');
    }
  }

  Future<void> _fetchTables() async {
    final response = await http.get(Uri.parse('http://localhost:3000/tables_all'));
    final int statusCode = response.statusCode;
    if (statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      final List<Table> tables = data.map((item) => Table.fromJson(item)).toList();
      setState(() {
        _tables = tables;
        _initializeControllers();
      });
    } else {
      throw Exception('Failed to load tables: $statusCode');
    }
  }

  void _initializeControllers() {
    final List<Table> filteredTables = _selectedCategory != null
        ? _tables.where((table) => table.category_id == _selectedCategory!.category_id).toList()
        : [];
    _nameControllers = {};
    _elegantNameControllers = {};
    _capacityControllers = {};
    filteredTables.forEach((table) {
      _nameControllers[table.id] = TextEditingController(text: table.name);
      _elegantNameControllers[table.id] = TextEditingController(text: table.elegant_name);
      _capacityControllers[table.id] = TextEditingController(text: table.capacity.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('餐桌设置页面'),
      ),
      body: Row(
        children: [
          Expanded(child: _buildCategoryList()),
          VerticalDivider(),
          Expanded(child: _buildTableList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTableDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildCategoryList() {
    if (_tableCategories.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _tableCategories.length + 1,
      itemBuilder: (context, index) {
        if (index == _tableCategories.length) {
          return ListTile(
            leading: Icon(Icons.add),
            title: Text('添加新类别'),
            onTap: _showAddCategoryDialog,
          );
        }
        final TableCategory category = _tableCategories[index];
        return ListTile(
          leading: Checkbox(
            value: category.is_active == 1,
            onChanged: (bool? value) {
              setState(() {
                category.is_active = value! ? 1 : 0;
              });
            },
          ),
          title: Text(category.category_name),
          tileColor: _selectedCategory == category ? Colors.blue.withOpacity(0.2) : null,
          onTap: () {
            setState(() {
              _selectedCategory = category;
              _initializeControllers();
            });
          },
        );
      },
    );
  }

  // _buildTableList  
  
  
  // 继续 _DinningTableSettingsState 类的定义...

  Widget _buildTableList() {
    if (_selectedCategory == null) {
      return Center(child: Text('请选择一个类别'));
    }
    return ListView.builder(
      itemCount: _tables.length,
      itemBuilder: (BuildContext context, int index) {
        final Table table = _tables[index];
        return ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _nameControllers[table.id]!,
                  decoration: InputDecoration(labelText: '桌名'),
                  onChanged: (String newValue) {
                    _updateTableName(table.id, newValue);
                  },
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: _elegantNameControllers[table.id]!,
                  decoration: InputDecoration(labelText: '雅称'),
                  onChanged: (String newValue) {
                    _updateTableElegantName(table.id, newValue);
                  },
                ),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: _capacityControllers[table.id]!,
                  decoration: InputDecoration(labelText: '座位数'),
                  keyboardType: TextInputType.number,
                  onChanged: (String newValue) {
                    _updateTableCapacity(table.id, int.tryParse(newValue) ?? 0);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddCategoryDialog() {
    final _formKey = GlobalKey<FormState>();
    final _categoryNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('新增类别'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _categoryNameController,
              decoration: InputDecoration(labelText: '类别名称'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入类别名称';
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('确认增加'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addCategory(_categoryNameController.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addCategory(String categoryName) async {
    String pinyinInitials = PinyinHelper.getShortPinyin(categoryName).toUpperCase();
    final response = await http.post(
      Uri.parse('http://localhost:3000/add_category'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'category_name': categoryName,
        'category_id': pinyinInitials,
        'is_active': 1,
      }),
    );

    if (response.statusCode == 200) {
      _fetchTableCategories();
    } else {
      throw Exception('Failed to add category');
    }
  }

  void _showAddTableDialog() {
    final _formKey = GlobalKey<FormState>();
    final Map<String, TextEditingController> fields = {
      'tableName': TextEditingController(),
      'elegantName': TextEditingController(),
      'capacity': TextEditingController(),
    };

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Table'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...fields.keys.map((field) => TextFormField(
                  controller: fields[field],
                  decoration: InputDecoration(labelText: field.capitalizeFirst),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value for ${field.capitalizeFirst}';
                    }
                    return null;
                  },
                )).toList(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addTable(
                    fields['tableName']!.text,
                    fields['elegantName']!.text,
                    int.parse(fields['capacity']!.text),
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _addTable(String tableName, String elegantName, int capacity) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/add_table'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'table_name': tableName,
        'elegant_name': elegantName,
        'capacity': capacity,
      }),
    );

    if (response.statusCode == 200) {
      _fetchTables();
    } else {
      throw Exception('Failed to add table');
    }
  }

  Future<void> _updateTableName(int tableId, String newName) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/update_table_name'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'table_id': tableId,
        'table_name': newName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update table name');
    }
  }

  Future<void> _updateTableElegantName(int tableId, String newName) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/update_table_elegant_name'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'table_id': tableId,
        'elegant_name': newName,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update table elegant name');
    }
  }

  Future<void> _updateTableCapacity(int tableId, int newCapacity) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/update_table_capacity'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({
        'table_id': tableId,
        'capacity': newCapacity,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update table capacity');
    }
  }
}

extension StringExt on String {
  String capitalizeFirst() => '${this[0].toUpperCase()}${substring(1)}';
}

class PinyinHelper {
  static String getShortPinyin(String chs) {
    return PinyinHelper.convert(chs)[0];
  }

  static String convert(String chs) {
    return Pinyin.convertToPinyinString(chs, strict: true)
        .replaceAllMapped(RegExp(r'[^\u4e00-\u9fa5]'), (match) => '')
        .toUpperCase();
  }
}

class TableCategory {
  final int id;
  final String category_id;
  final String category_name;
  int is_active;

  TableCategory({required this.id, required this.category_id, required this.category_name, required this.is_active});

  factory TableCategory.fromJson(Map<String, dynamic> json) {
    return TableCategory(
      id: json['id'],
      category_id: json['category_id'],
      category_name: json['category_name'],
      is_active: json['is_active'],
    );
  }
}

class Table {
  final int id;
  String name;
  String elegant_name;
  int capacity;
  final String category_id;

  Table({required this.id, required this.name, required this.elegant_name, required this.capacity, required this.category_id});

  factory Table.fromJson(Map<String, dynamic> json) {
    return Table(
      id: json['id'],
      name: json['name'] ?? '',
      elegant_name: json['elegant_name'] ?? '',
      capacity: json['capacity'] ?? 0,
      category_id: json['category_id'] ?? '',
    );
  }
}
  
  
  
}