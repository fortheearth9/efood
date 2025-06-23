import 'package:flutter/material.dart';
import 'package:pinyin/pinyin.dart';

class PinyinExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('汉字转拼音首字母示例'),
      ),
      body: Center(
        child: Text(
          '汉字字符串：你好世界',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String hanString = "你好世界";
          String pinyinInitials = PinyinHelper.getShortPinyin(hanString).toUpperCase();
          // 显示转换结果
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('拼音首字母'),
                content: Text(pinyinInitials),
                actions: <Widget>[
                  TextButton(
                    child: Text('确定'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.translate),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PinyinExample(),
  ));
}