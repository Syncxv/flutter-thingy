import 'package:appy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            title: Text(
              "Goals",
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
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: const HeaderHEHE(),
            ),
          )
        ],
      ),
    );
  }
}
