import 'package:appy/config/palette.dart';
import 'package:flutter/material.dart';

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
              child: _PlusBtn()),
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

class _PlusBtn extends StatelessWidget {
  const _PlusBtn({Key? key}) : super(key: key);

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
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
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
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    )),
              );
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Text(
            "New Goal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
