import 'package:appy/models/models.dart';
import 'package:appy/util/shared_preferences.dart';
import 'package:appy/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TodoBttomTabBar extends StatefulWidget {
  final TodoSection todo;
  final Future<void> Function() setTasks;
  const TodoBttomTabBar({Key? key, required this.todo, required this.setTasks})
      : super(key: key);

  @override
  State<TodoBttomTabBar> createState() => _TodoBttomTabBarState();
}

class _TodoBttomTabBarState extends State<TodoBttomTabBar> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: const [],
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ), //color is transparent so that it does not blend with the actual color specified
        gradient: const LinearGradient(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
          stops: [0.25, 0.90],
          colors: [
            Colors.white,
            Color.fromRGBO(255, 255, 255, 0.0),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Button(
            icon: Icons.add,
            text: "New Task",
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => TaskDaialog(todo: widget.todo),
              );
            },
          ),
        ],
      ),
    );
  }
}

class TaskDaialog extends StatefulWidget {
  final TodoSection todo;
  TaskDaialog({Key? key, required this.todo}) : super(key: key);

  @override
  State<TaskDaialog> createState() => Task_DaialogState();
}

class Task_DaialogState extends State<TaskDaialog> {
  @override
  bool completed = false;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TodoSection findTodo(int id, List<TodoSection> list) =>
      list.firstWhere((todo) => todo.id == id);
  void submitTask() async {
    print("SUBMITTED");
    var todos = await getTodos();
    var index = todos.indexWhere((element) => element.id == widget.todo.id);
    print(index);
    widget.todo.todoItems.add(
      Todos(
        completed: completed,
        title: taskNameController.text,
        description: taskNameController.text,
      ),
    );
    if (index != -1) {
      todos[index] = widget.todo;
      final String encodedData = TodoSection.encode(todos);
      saveTodos(encodedData);
    } else {
      Fluttertoast.showToast(
        msg: "OH NO",
        backgroundColor: Colors.red,
      );
    }
    Navigator.of(context).pop('dialog');
  }

  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white.withOpacity(0.9),
              centerTitle: true,
              floating: true,
              automaticallyImplyLeading: false,
              flexibleSpace: TextField(
                controller: taskNameController,
                onEditingComplete: submitTask,
                textAlignVertical: TextAlignVertical.center,
                autofocus: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10.0),
                  hintStyle: const TextStyle(fontSize: 14.0),
                  hintText: "Name Of Task",
                  alignLabelWithHint: true,
                  prefixIcon: IconButton(
                    onPressed: () => setState(() {
                      print("PRESSED");
                      completed = !completed;
                    }),
                    icon: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Opacity(
                        opacity: completed ? 1 : 0,
                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: IconButton(
                    padding: const EdgeInsets.all(10.0),
                    onPressed: submitTask,
                    icon: const Icon(Icons.check),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              sliver: SliverToBoxAdapter(
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    hintStyle: TextStyle(fontSize: 14.0),
                    hintText: "Description (optinal)",
                    alignLabelWithHint: true,
                  ),
                  controller: taskDescriptionController,
                  keyboardType: TextInputType.multiline,
                  minLines: 24,
                  maxLines: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
