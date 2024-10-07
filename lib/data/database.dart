import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_rev/main.dart';

class ToDoDataBase{
  // todolist:
  List todoList = [];
  // reference the box
  final _myBox = Hive.box("myBox");

  // create the data from the database when the app is run for the first time
  void createInitialData() {
    todoList = [
      ["Revise the To Do App Code", false],
      ["Exercise", false],
    ];
  }
  // load the saved data:
  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }
  // update the data:
  void updateData(){
    _myBox.put("TODOLIST", todoList);
  }
}