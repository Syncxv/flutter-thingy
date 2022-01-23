import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<_WOAH> _key = GlobalKey();
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.red,
            centerTitle: true,
            floating: true,
            title: Text(
              "WOAH",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: const TEXTTHINGY(),
            ),
          )
        ],
      ),
    );
  }
}

class TEXTTHINGY extends StatefulWidget {
  const TEXTTHINGY({Key? key}) : super(key: key);

  @override
  _WOAH createState() => _WOAH();
}

class _WOAH extends State<TEXTTHINGY> {
  bool hehe = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              hehe = !hehe;
            });
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[600]),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: const Text(
            "New",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
