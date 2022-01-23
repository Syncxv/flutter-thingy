import 'package:flutter/material.dart';

class BttomTabBar extends StatelessWidget {
  const BttomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white,
          ],
        ),
      ),
      child: Stack(children: const [
        Icon(Icons.folder),
      ]),
    );
  }
}
