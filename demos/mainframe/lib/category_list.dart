import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  CategoryList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categories[index]['categoryName']),
        );
      },
    );
  }
}