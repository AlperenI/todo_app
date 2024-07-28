
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final controller;
  const DialogBox({super.key, this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                hintText: "yeni görev ekle",
                ),
            ),

            //buttons->save+cancel
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: onSave),
                SizedBox(width:8.0,),
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}