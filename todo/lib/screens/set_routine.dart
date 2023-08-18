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
        onPressed: () {
          _showModealBottomSheet(context);
        },
        child: Icon(Icons.add_task),
      ),
    );
  }
}

//create modeal bottom sheet
void _showModealBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Add a new task",
                    ),
                  ),
                ),
                SizedBox(width: 12),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel", style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Save", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
