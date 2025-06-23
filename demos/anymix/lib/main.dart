import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

void main() {
  runApp(FileManagerApp());
}

class FileManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Manager Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FileManagerHomePage(),
    );
  }
}

class FileManagerHomePage extends StatefulWidget {
  @override
  _FileManagerHomePageState createState() => _FileManagerHomePageState();
}

class _FileManagerHomePageState extends State<FileManagerHomePage> {
  Directory? _rootDirectory;
  List<FileSystemEntity>? _files;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      _loadFiles();
    }
  }

  Future<void> _loadFiles() async {
    _rootDirectory = Directory('/');
    setState(() {
      _files = _rootDirectory?.listSync().where((entity) {
        return entity is File || entity is Directory;
      }).toList();
    });
  }

  Future<void> _createFile() async {
    final file = File('${_rootDirectory?.path}/new_file.txt');
    await file.writeAsString('Hello, world!');
    setState(() {
      _files = _rootDirectory?.listSync().where((entity) {
        return entity is File || entity is Directory;
      }).toList();
    });
  }

  Future<void> _deleteFile(File file) async {
    await file.delete();
    setState(() {
      _files = _rootDirectory?.listSync().where((entity) {
        return entity is File || entity is Directory;
      }).toList();
    });
  }

  Future<void> _copyFile(File file) async {
    final newFilePath = '${file.path}.copy';
    await file.copy(newFilePath);
    setState(() {
      _files = _rootDirectory?.listSync().where((entity) {
        return entity is File || entity is Directory;
      }).toList();
    });
  }

  Future<void> _processFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        // Process the file
        print('Processing file: $filePath');
      } else {
        print('File does not exist: $filePath');
      }
    } catch (e) {
      print('Error processing file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Manager Demo'),
      ),
      body: _files == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _files?.length,
              itemBuilder: (context, index) {
                final file = _files![index];
                if (file is File) {
                  return ListTile(
                    title: Text(file.path.split('/').last),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () => _copyFile(file),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _deleteFile(file),
                        ),
                      ],
                    ),
                  );
                } else if (file is Directory) {
                  return ListTile(
                    title: Text(file.path.split('/').last),
                    subtitle: Text('Directory'),
                  );
                } else {
                  return Container();
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createFile,
        child: Icon(Icons.add),
      ),
    );
  }
}