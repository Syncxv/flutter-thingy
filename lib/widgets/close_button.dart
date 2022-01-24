import 'package:flutter/material.dart';

class WhatCloseButton extends StatelessWidget {
  const WhatCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 8,
      buttonColor: Colors.white.withOpacity(0.4),
      child: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
