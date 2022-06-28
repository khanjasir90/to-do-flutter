import 'package:flutter/material.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:provider/provider.dart';

class Task extends StatelessWidget {
  late final String id;
  late final String taskName;
  Task(this.id, this.taskName);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            color: Color.fromRGBO(31, 30, 60, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    taskName,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5,5,10,5),
                  width: 45,
                  child: FloatingActionButton(onPressed: () {
                    print("hello");
                    context.read<TaskProvider>().deleteTask(id);
                  },
                  child: Icon(Icons.delete),
                ),
                )
              ],
            )
        ),
      ],
    );
  }
}
