import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class MenuService {
  static Future<List<dynamic>> loadMenu() async {
    final String response = await rootBundle.loadString('assets/menu.json');
    return json.decode(response);
  }
}
