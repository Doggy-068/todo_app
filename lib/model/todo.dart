import 'package:flutter/material.dart';

enum ModelTodoType {
  red(name: 'Red', value: Colors.red),
  orange(name: 'Orange', value: Colors.orange),
  green(name: 'Green', value: Colors.green);

  const ModelTodoType({required this.name, required this.value});

  final String name;
  final Color value;
}

class ModelTodo {
  int id;
  ModelTodoType type;
  DateTime startTime;
  String title;
  String content;

  ModelTodo({
    required this.id,
    required this.type,
    required this.startTime,
    required this.title,
    required this.content,
  });

  bool get isOutDate =>
      DateTime.now().subtract(const Duration(days: 1)).isAfter(startTime);
}
