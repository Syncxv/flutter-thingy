import 'package:appy/models/models.dart';
import 'package:appy/util/shared_preferences.dart';
import 'package:appy/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoSection>? todos;

  @override
  void initState() {
    _setTodos();
    super.initState();
  }

  void _setTodos() async {
    var data = await getTodos();
    setState(() {
      todos = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool todoExists = todos != null;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BttomTabBar(setTodos: _setTodos),
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
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: const HeaderHEHE(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              children: todos != null
                  ? todos!
                      .map((todo) =>
                          TodoCard(title: todo.name, color: todo.color))
                      .toList()
                  : [],
            ),
          )
        ],
      ),
    );
  }
}
