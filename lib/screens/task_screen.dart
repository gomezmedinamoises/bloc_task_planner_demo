import 'package:bloc_task_planner_demo/blocs/bloc/tasks_state.dart';
import 'package:bloc_task_planner_demo/blocs/bloc_exports.dart';
import 'package:bloc_task_planner_demo/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.allTasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks App'),
          actions: [
            IconButton(
                onPressed: () => _addTask(context), icon: const Icon(Icons.add))
          ],
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Center(
            child: Chip(label: Text('Tasks:')),
          ),
          TasksList(taskList: tasksList)
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
