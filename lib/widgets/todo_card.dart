import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TodoCard extends StatelessWidget {
  final String title;
  final Color color;
  const TodoCard({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(":O very cool $title");
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                  child: Stack(children: [
                    Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              color: useWhiteForeground(color)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ])),
            ),
          ),
        ),
      ),
    );
  }
}
