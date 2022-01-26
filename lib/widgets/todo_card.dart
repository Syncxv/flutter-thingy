import 'package:appy/models/models.dart';
import 'package:appy/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:timeago/timeago.dart' as timeago;

class TodoCard extends StatelessWidget {
  final TodoSection todo;
  final void Function() setTodos;

  const TodoCard({Key? key, required this.todo, required this.setTodos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeidk = timeago.format(
      todo.dateCreated,
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TodoScreen(todo: todo, setTodos: setTodos),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: todo.color),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                              color: useWhiteForeground(todo.color, bias: 100.0)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          Text(
                            timeidk,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: useWhiteForeground(todo.color, bias: 100.0)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                      TodoCardFotter(todo: todo),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoCardFotter extends StatelessWidget {
  final TodoSection todo;

  const TodoCardFotter({Key? key, required this.todo}) : super(key: key);

  int getCompleted() =>
      todo.todoItems.where((element) => element.completed).toList().length;

  @override
  Widget build(BuildContext context) {
    final stringThing = todo.todoItems.isEmpty
        ? "0 of 0"
        : "${getCompleted()} of ${todo.todoItems.length}";
    final double val =
        todo.todoItems.isEmpty ? 0.0 : getCompleted() / todo.todoItems.length;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        stringThing,
        style: TextStyle(
          fontSize: 18.0,
          color: useWhiteForeground(todo.color, bias: 100.0)
              ? Colors.white
              : Colors.black,
        ),
      ),
      CircularProgressIndicator(
        value: val,
        backgroundColor: useWhiteForeground(todo.color, bias: 100.0)
            ? Colors.white.withOpacity(0.5)
            : Colors.black.withOpacity(0.5),
        valueColor: AlwaysStoppedAnimation(
          useWhiteForeground(todo.color, bias: 100.0)
              ? Colors.white
              : Colors.black,
        ),
      )
    ]);
  }
}
