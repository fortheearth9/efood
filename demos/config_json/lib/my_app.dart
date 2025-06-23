import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'config.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Config _config;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final jsonString = await rootBundle.loadString('assets/config.json');
    final jsonMap = jsonDecode(jsonString);
    setState(() {
      _config = Config.fromJson(jsonMap);
      print('Config loaded: ${_config.title}');
    });
  }

  void updateConfig(Config newConfig) {
    setState(() {
      _config = newConfig;
      print('Config updated: ${_config.title}');
      saveConfig();
    });
  }

  void saveConfig() async {
    final file = File('assets/config.json');
    final jsonConfig = jsonEncode(_config.toJson());
    await file.writeAsString(jsonConfig);
    print('Config saved: ${_config.title}');
  }

  @override
  Widget build(BuildContext context) {
    if (_config == null) {
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      title: _config.title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_config.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Window size: ${_config.size.width} x ${_config.size.height}'),
              ElevatedButton(
                onPressed: () {
                  updateConfig(
                      Config(title: 'Updated App', size: Size(400, 800)));
                },
                child: Text('Update Config'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
