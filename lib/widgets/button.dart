import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool icon;
  final String text;
  final VoidCallback onPressed;
  const Button(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(const EdgeInsets.all(13.0)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      onPressed: () => onPressed(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon)
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
