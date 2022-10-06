import 'package:todo_flutter/app/data/models/task.dart';
import 'package:todo_flutter/app/data/providers/task/provider.dart';

class TastRepositery {
  TaskProvider taskProvider;
  TastRepositery({required this.taskProvider});

  List<Task> readTask() => taskProvider.readTasks();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
