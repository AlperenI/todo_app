// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool TaskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
    ToDoTile({super.key, required this.taskName, required this.TaskCompleted,required this.onChanged,required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: TaskCompleted, 
                onChanged: onChanged,
                activeColor:Colors.green ,
                ),
             //task name
              Text(taskName,
              style: TextStyle(
                decoration:TaskCompleted ? TextDecoration.lineThrough:TextDecoration.none ),
                ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
            ),
        ),
      ),
    );
  }
}