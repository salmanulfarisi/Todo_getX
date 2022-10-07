import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_flutter/app/core/utils/keys.dart';
import 'package:todo_flutter/app/data/models/task.dart';
import 'package:todo_flutter/app/data/services/storage/services.dart';

class TaskProvider {
  final StorageService _storage = Get.put(StorageService());

// {'tasks':[{
// 'title':"work",
// "color":"0ff123456"
// "icon":"0xe123"
// }]}

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
    // _storage.write(taskKey, tasks);
  }
}
