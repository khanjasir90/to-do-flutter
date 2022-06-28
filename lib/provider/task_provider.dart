import 'package:flutter/material.dart';
import '../models/task_model.dart';
class TaskProvider with ChangeNotifier {
  List<ToDoTask> task = [];
  int index = 0;
  List<ToDoTask> getAllTask() {
    return task;
  }

  void addTask(String title) {
    task.add(ToDoTask(index.toString(), title));
    index++;
    notifyListeners();
  }
  
  void deleteTask(String id) {
    print(id);
    task.removeWhere((element) {
      return element.id == id;
    });
    notifyListeners();
  }

}
