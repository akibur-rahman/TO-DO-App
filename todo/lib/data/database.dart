import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //data list
  List toDoList = [];

  //referance box
  final _myBox = Hive.box('mybox');

  void createInintrialData() {
    toDoList = [
      ["Go to GYM", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
