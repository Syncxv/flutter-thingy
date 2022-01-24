import 'package:shared_preferences/shared_preferences.dart';
import 'package:appy/models/models.dart';

Future<List<TodoSection>> getTodos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final todoArrayString = prefs.getString('todos') ?? "[]";
  final List<TodoSection> realTodoArry = TodoSection.decode(todoArrayString);
  return realTodoArry;
}

Future<void> saveTodos(String encodedData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('todos', encodedData);
}
