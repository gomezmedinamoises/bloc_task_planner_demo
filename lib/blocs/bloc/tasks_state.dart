import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../models/task.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  const TasksState({this.allTasks = const <Task>[]});

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {'allTasks': allTasks.map((e) => e.toMap()).toList()};
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        allTasks: List<Task>.from((map['allTracks'] as List<int>)
            .map<Task>((x) => Task.fromMap(x as Map<String, dynamic>))));
  }
}

class TasksInitial extends TasksState {}
