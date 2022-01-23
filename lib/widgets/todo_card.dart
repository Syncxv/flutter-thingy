import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String title;

  const TodoCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 170,
            height: 170,
            child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: Stack(children: [
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
