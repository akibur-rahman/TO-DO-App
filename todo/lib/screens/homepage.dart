import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/screens/set_routine.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';
import 'package:todo/util/about_dialog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //text controller
  TextEditingController _controller = TextEditingController();
  //database
  final _myBox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  //OnChanged mehod for checkbox

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInintrialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    if (_controller.text == "") {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.yellow,
          content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.close_rounded,
                  size: 44,
                  color: Colors.red,
                ),
                Text(
                  "Empty Data not allowed",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 7,
                ),
                MaterialButton(
                  color: Colors.yellow[200],
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    "Close",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateData();
    }
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  void taskCompleted(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "TO-DO",
        ),
        elevation: 0,
      ),
      //Navigation Drawer
      drawer: Drawer(
        backgroundColor: Colors.yellow,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 80,
                  ),
                  Text(
                    "TO-DO",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.task,
                size: 24,
                color: Colors.black,
              ),
              title: Text(
                "Set Routine",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SetRoutine(),
                  ),
                );
              },
            ),
            AboutDialogBox(),
          ],
        ),
      ),
      //background color for body
      backgroundColor: Colors.yellow[200],
      //floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      //body of the page
      body: Container(
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFuncation: (context) => deleteTask(index),
              completeFunction: (context) => taskCompleted(index),
            );
          },
        ),
      ),
    );
  }
}
