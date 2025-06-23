import 'package:flutter/material.dart';

class Config {
  final String title;
  final Size size;

  Config({required this.title, required this.size});

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      title: json['title'],
      size: Size(json['size']['width'], json['size']['height']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'size': {
          'width': size.width,
          'height': size.height,
        },
      };
}
