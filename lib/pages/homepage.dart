import 'package:flutter/material.dart';
import 'package:todoapp_rev/data/database.dart';
import 'package:todoapp_rev/utils/todotile.dart';
import 'package:todoapp_rev/utils/dialogbox.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_rev/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // reference the Hive box
  final _myBox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST")==null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void onChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask(){
    showDialog(
      context: (context),
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
      );}
    );
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[400],
        title: const Text(
            "TO DO APP REVISED",
          style: TextStyle(
            color: Colors.white,
          )
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.deepPurple[200],
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite, size:48.0, color:Colors.deepPurpleAccent)),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
                },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                /*Home*/ Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: const Icon(Icons.add,),
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => onChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          }
      )
    );
  }
}
