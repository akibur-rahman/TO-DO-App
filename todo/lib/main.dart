import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/screens/homepage.dart';
import 'package:todo/screens/set_routine.dart';

void main() async {
  //hive init
  await Hive.initFlutter();
  //open box
  var box = await Hive.openBox('mybox');
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
