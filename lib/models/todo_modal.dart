import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TodoSection {
  final Color color;
  final String name;
  final DateTime dateCreated;
  final int id;
  List<Todos> todoItems;

  TodoSection({
    required this.name,
    required this.color,
    required this.todoItems,
    required this.dateCreated,
    required this.id,
  });

  factory TodoSection.fromJson(Map<String, dynamic> jsonData) {
    return TodoSection(
      id: jsonData['id'],
      dateCreated: DateTime.parse(jsonData['dateCreated']),
      name: jsonData['name'],
      color: colorFromHex(jsonData['color'])!,
      todoItems: Todos.dynamicToListTodos(Todos.decode(jsonData['todoItems'])),
    );
  }

  Map<String, dynamic> toMapCurrentInstance() {
    return {
      'id': id,
      'name': name,
      //https://stackoverflow.com/a/62554595 this man is a genius
      'color': '#${color.value.toRadixString(16).substring(2, 8)}',
      'todoItems': todoItems
    };
  }

  static Map<String, dynamic> toMap(TodoSection todoSection) => {
        'id': todoSection.id,
        'name': todoSection.name,
        'color':
            '#${todoSection.color.value.toRadixString(16).substring(2, 8)}',
        'todoItems': Todos.encode(todoSection.todoItems),
        'dateCreated': todoSection.dateCreated.toString(),
      };
  static String encode(List<TodoSection> todos) {
    var listy = todos
        .map<Map<String, dynamic>>((todo) => TodoSection.toMap(todo))
        .toList();
    print(listy);
    return json.encode(listy);
  }

  static List<TodoSection> decode(String todoSections) =>
      (json.decode(todoSections) as List<dynamic>)
          .map<TodoSection>((item) => TodoSection.fromJson(item))
          .toList();
}

class Todos {
  final String title;
  final String description;
  final int id;
  bool completed;

  Todos({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  factory Todos.fromJson(Map<String, dynamic> jsonData) {
    return Todos(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      completed: jsonData['completed'],
    );
  }

  Map<String, dynamic> toMapCurrent() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed
    };
  }

  static Map<String, dynamic> toMap(Todos todo) {
    return {
      'id': todo.id,
      'title': todo.title,
      'description': todo.description,
      'completed': todo.completed
    };
  }

  static String encode(List<Todos> todos) => json.encode(
        todos.map<Map<String, dynamic>>((todo) => Todos.toMap(todo)).toList(),
      );

  static List<Todos> decode(String todos) =>
      (json.decode(todos) as List<dynamic>)
          .map<Todos>((item) => Todos.fromJson(item))
          .toList();

  static List<Todos> dynamicToListTodos(List<dynamic> dynamicList) =>
      (dynamicList.map(
        (todo) => Todos(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          completed: todo.completed,
        ),
      )).toList();
}
