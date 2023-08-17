import 'package:flutter/material.dart';

class SetRoutine extends StatefulWidget {
  const SetRoutine({super.key});

  @override
  State<SetRoutine> createState() => _SetRoutineState();
}

class _SetRoutineState extends State<SetRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Set Daily Routine"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.yellow[200],
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_task),
      ),
    );
  }
}
