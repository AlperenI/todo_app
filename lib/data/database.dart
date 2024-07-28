import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List toDoList=[];
 //reference our box
 final _myBox=Hive.box("mybox");

// run this method if this is the 1st time ever openin this app
 void createInitialData(){
  toDoList=[
    ["deneme 1",false],
    ["deneme 2",true],
  ];
 }
 //load the data from database
 void loadData(){
 toDoList=_myBox.get("TODOLIST");
 }
 //update the database
 void updateDatabase(){
  _myBox.put("TODOLIST", toDoList);
 }
}