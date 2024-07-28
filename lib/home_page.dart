// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox=Hive.box("mybox");

  ToDoDataBase db=ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST")==null) {
      db.createInitialData();
    }else{ //there already exits the data
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller=TextEditingController();



  //checkbox was tapped
  void chechBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDatabase();
  }
  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
      db.updateDatabase();
    });
  }

  //create new task
  void createNewTask(){
    showDialog(
        context: context, 
        builder: (context){
        return DialogBox(
          controller:_controller ,
          onSave: saveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      }
      );
    }

    //delete task
    void deleteTask(int index){
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDatabase();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],

      appBar: AppBar(
        title: Center(child: Text("TO DO APP")),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),

      floatingActionButton: FloatingActionButton(backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder:(context, index) {

          return ToDoTile(
            taskName: db.toDoList[index][0], 
            TaskCompleted: db.toDoList[index][1], 
            onChanged:(value)=>chechBoxChanged(value,index),
            deleteFunction:(context)=>deleteTask(index),
          );
        },
      ),
    );
  }
}