import 'package:appy/models/models.dart';
import 'package:appy/util/shared_preferences.dart';
import 'package:appy/widgets/todo_bottom_tab_bar.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  final TodoSection todo;
  const TodoScreen({Key? key, required this.todo}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    test();
  }

  void test() async {
    var todos = await getTodos();
    print(todos[0].todoItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: TodoBttomTabBar(todo: widget.todo),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                )
              ],
              backgroundColor: Colors.white,
              floating: true,
              centerTitle: false,
              title: Text(
                widget.todo.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
