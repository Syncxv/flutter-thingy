import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TodoSection {
  final Color color;
  final String name;
  final DateTime dateCreated;
  List<Todos> todoItems;

  TodoSection(
      {required this.name,
      required this.color,
      required this.todoItems,
      required this.dateCreated});

  factory TodoSection.fromJson(Map<String, dynamic> jsonData) {
    return TodoSection(
      dateCreated: DateTime.parse(jsonData['dateCreated']),
      name: jsonData['name'],
      color: colorFromHex(jsonData['color'])!,
      todoItems: Todos.dynamicToListTodos(jsonData['todoItems']),
    );
  }

  Map<String, dynamic> toMapCurrentInstance() {
    return {
      'name': name,
      //https://stackoverflow.com/a/62554595 this man is a genius
      'color': '#${color.value.toRadixString(16).substring(2, 8)}',
      'todoItems': todoItems
    };
  }

  static Map<String, dynamic> toMap(TodoSection todoSection) => {
        'name': todoSection.name,
        'color':
            '#${todoSection.color.value.toRadixString(16).substring(2, 8)}',
        'todoItems': todoSection.todoItems,
        'dateCreated': todoSection.dateCreated.toString(),
      };
  static String encode(List<TodoSection> todos) => json.encode(
        todos
            .map<Map<String, dynamic>>((todo) => TodoSection.toMap(todo))
            .toList(),
      );

  static List<TodoSection> decode(String todoSections) =>
      (json.decode(todoSections) as List<dynamic>)
          .map<TodoSection>((item) => TodoSection.fromJson(item))
          .toList();
}

class Todos {
  final String title;
  final String description;
  final bool completed;

  Todos(
      {required this.title,
      required this.description,
      required this.completed});

  factory Todos.fromJson(Map<String, dynamic> jsonData) {
    return Todos(
      title: jsonData['title'],
      description: jsonData['description'],
      completed: jsonData['completed'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'completed': completed};
  }

  static List<Todos> decode(String todos) =>
      (json.decode(todos) as List<dynamic>)
          .map<Todos>((item) => Todos.fromJson(item))
          .toList();

  static List<Todos> dynamicToListTodos(List<dynamic> dynamicList) =>
      (dynamicList.map(
        (todo) => Todos(
            title: todo.title,
            description: todo.description,
            completed: todo.completed),
      )).toList();
}
