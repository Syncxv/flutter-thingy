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
                      todoItems!
                          .map(
                              (elem) => TaskItem(task: elem, todo: widget.todo))
                          .toList(),
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  )
          ],
        ));
  }
}

class TaskItem extends StatefulWidget {
  Todos task;
  final TodoSection todo;

  TaskItem({Key? key, required this.task, required this.todo})
      : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  Future<void> saveTask() async {
    //spegiei code gang
    var todos = await getTodos();
    var index = todos.indexWhere((element) => element.id == widget.todo.id);
    var taskIndex = todos[index]
        .todoItems
        .indexWhere((element) => element.id == widget.task.id);
    todos[index].todoItems[taskIndex] = widget.task;
    print(todos[index].todoItems[taskIndex].completed);
    final String encodedData = TodoSection.encode(todos);
    saveTodos(encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      width: double.infinity,
      color: Colors.black.withOpacity(0.2),
      child: Row(
        children: [
          IconButton(
            onPressed: () => setState(() {
              print("PRESSED");
              widget.task.completed = !widget.task.completed;
              saveTask();
            }),
            icon: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                ),
                shape: BoxShape.circle,
              ),
              child: Opacity(
                opacity: widget.task.completed ? 1 : 0,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Text(widget.task.title),
        ],
      ),
    );
  }
}
