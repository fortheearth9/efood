import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于我们'),
      ),
      body: const Center(
        child: Text('版本号：1.0.0\n\n靠谱收银系统\n\n关于我们页面'),
      ),
    );
  }
}
