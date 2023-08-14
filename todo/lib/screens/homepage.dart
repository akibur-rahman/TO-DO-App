import 'package:flutter/material.dart';
import 'package:todo/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO"),
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      body: Container(
        child: ListView(
          children: [
            ToDoTile(),
            ToDoTile(),
            ToDoTile(),
            ToDoTile(),
          ],
        ),
      ),
    );
  }
}
