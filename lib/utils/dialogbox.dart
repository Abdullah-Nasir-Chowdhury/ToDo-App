// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp_rev/utils/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[400],
      content: Container(
        height: 130,
        child: Column(
          children: [
            // Text Field
            // ignore: prefer_const_constructors
            TextField(
              // ignore: prefer_const_constructors
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Input your next task..",
              ),
            ),
            // Row of Buttons
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:[
                // save button
                Buttons(text: "Save", onPressed: onSave),
                SizedBox(width: 12.0),
                // cancel button
                Buttons(text: "Cancel", onPressed: onCancel,)
              ]
            )
          ],
        )
      ),
    );
  }
}
