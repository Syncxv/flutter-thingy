import 'package:appy/config/palette.dart';
import 'package:appy/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class BttomTabBar extends StatelessWidget {
  const BttomTabBar({Key? key}) : super(key: key);
  final leftRightMargin = 35.0;
  final bottomMargin = 15.0;
  final iconSize = 36.0;
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: bottomMargin,
              left: leftRightMargin,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.folder,
                color: Colors.blue,
                size: iconSize,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  stops: [
                    0.10,
                    0.93,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF16BCFE),
                    Color(0xFF4455EE),
                  ],
                )),
            child: Button(
              icon: true,
              text: "New Goal",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const _PopupDialog(),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: bottomMargin,
              right: leftRightMargin,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.check_circle_outline,
                color: Colors.grey.shade600,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupDialog extends StatefulWidget {
  const _PopupDialog({Key? key}) : super(key: key);

  @override
  State<_PopupDialog> createState() => _PopupDialogState();
}

class _PopupDialogState extends State<_PopupDialog> {
  Color color = Colors.orange;
  Widget itemBuilder(
      Color color, bool isCurrentColor, void Function() changeColor) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(4.0),
      margin: const EdgeInsets.all(7),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
                color: color.withOpacity(0.8),
                offset: const Offset(1, 2),
                blurRadius: 5)
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: changeColor,
            borderRadius: BorderRadius.circular(50),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 210),
              opacity: isCurrentColor ? 1 : 0,
              child: Icon(Icons.done,
                  color:
                      useWhiteForeground(color) ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget layoutBuilder(
      BuildContext context, List<Color> colors, PickerItem child) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          return child(colors[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
      child: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: color,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: const [
                      Positioned(
                        right: 0,
                        child: WhatCloseButton(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Name of todo :|',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlockPicker(
                pickerColor: color,
                availableColors: availableColors,
                onColorChanged: (color) => setState(() => this.color = color),
                layoutBuilder: layoutBuilder,
                itemBuilder: itemBuilder,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      stops: [
                        0.10,
                        0.93,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF16BCFE),
                        Color(0xFF4455EE),
                      ],
                    )),
                child: Button(
                  icon: false,
                  text: "Create Goal",
                  onPressed: () {
                    print("HEHHE");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
