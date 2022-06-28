import 'package:flutter/material.dart';
import './widgets/task.dart';
import './provider/task_provider.dart';
import 'package:provider/provider.dart';
import './widgets/new_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TaskProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'My Flutter App',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  void addNewTask(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return NewTask();
    });
  }

  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo-Application",
          style: TextStyle(
            color: Colors.blue,
          ),
          textAlign: TextAlign.right,
        ),
        backgroundColor: Color.fromRGBO(31, 30, 60, 40),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ...task.getAllTask().map((tsk) {
                return Task(tsk.id, tsk.taskName);
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewTask(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
