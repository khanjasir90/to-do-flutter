import 'package:flutter/material.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:provider/provider.dart';

class NewTask extends StatelessWidget {
  final taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final addTask = Provider.of<TaskProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
                decoration: InputDecoration(labelText: 'Task'),
                controller: taskController,
              ),
              FlatButton(
                onPressed: () {
                  if(taskController.text == "") return;
                  addTask.addTask(taskController.text);
                  // submitData(addTask);
                },
                child: Text(
                  "Add Task",
                  style: TextStyle(
                    color: Color.fromRGBO(31,30,60,40),
                    fontSize: 16,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}