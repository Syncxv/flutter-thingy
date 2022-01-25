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
  List<Todos>? todoItems;
  @override
  void initState() {
    super.initState();
    updateState();
  }

  Future<void> updateState() async {
    var todos = await getTodos();
    var currentTodo =
        todos.firstWhere((element) => element.id == widget.todo.id);
    setState(() {
      todoItems = currentTodo.todoItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(todoItems);
    return Scaffold(
        extendBody: true,
        bottomNavigationBar:
            TodoBttomTabBar(todo: widget.todo, setTasks: updateState),
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
            todoItems != null
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      todoItems!.map((elem) => TaskItem(task: elem)).toList(),
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  )
          ],
        ));
  }
}

class TaskItem extends StatelessWidget {
  final Todos task;
  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      margin: EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
      child: Text(task.title),
    );
  }
}
