import 'package:appy/config/palette.dart';
import 'package:flutter/material.dart';

class HeaderHEHE extends StatefulWidget {
  const HeaderHEHE({Key? key}) : super(key: key);

  @override
  _HeaderTHingy createState() => _HeaderTHingy();
}

class _HeaderTHingy extends State<HeaderHEHE> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Recent",
                  style: TextStyle(
                    color: Palette.textMuted,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Palette.textMuted,
                ),
              ],
            ),
            const Icon(
              Icons.list,
              color: Palette.textMuted,
            )
          ],
        )
      ],
    );
  }
}
