import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: const Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: 150,
          height: 150,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
